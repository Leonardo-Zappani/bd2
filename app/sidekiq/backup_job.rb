# frozen_string_literal: true

class BackupJob
  include Sidekiq::Worker
  cron = '0 0 * * *'
  sidekiq_options(retry: 3, dead: true, cron:)

  def perform
    folder = Rails.root.join('public')
    command = 'pg_dump -U postgres -h localhost -p 5432 -d bd2 -f '
    system("#{command}#{folder}/backup.sql")

    puts 'Backup realizado com sucesso!'
  end
end
