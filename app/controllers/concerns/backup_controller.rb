class BackupController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy ]

  def backup
    folder = Rails.root.join('public')
    command = "pg_dump -U postgres -h localhost -p 5432 -d bd2 -f "
    system(command + folder.to_s + "/backup.sql")

    redirect_to '/backup.sql'
  end
end
