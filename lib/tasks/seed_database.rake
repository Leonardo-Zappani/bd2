namespace :db do
  desc "Seed fornecedores, funcionarios, itens, produtos, and vendas with 1 million records each"
  task seed_models: :environment do
    count = 0

    puts "Seeding Fornecedores..."
    10_000_000.times do |i|
      Fornecedore.create!(descricao: "Fornecedor ##{i + 1}")
      puts count
      count = count + 1
    end
    count = 0
    puts "Finished seeding Fornecedores."

    puts "Seeding Funcionarios..."
    10_000_000.times do |i|
      Funcionario.create!(
        nome: "Funcionario ##{i + 1}",
        cpf: "000#{i + 1}",
        senha: "password##{i + 1}",
        funcao: "Funcao ##{i + 1}"
      )
      puts count
      count = count + 1
    end
    count = 0
    puts "Finished seeding Funcionarios."

    # TODO: Ensure you have valid 'produto' and 'venda' IDs for 'Itens'
    puts "Seeding Itens..."
    10_000_000.times do |i|
      # The relations (produtos_id, vendas_id) should be valid. Properly adjust this logic.
      produto_id = Produto.order("RANDOM()").limit(1).pluck(:id).first
      venda_id = Venda.order("RANDOM()").limit(1).pluck(:id).first
      Iten.create!(
        quantidade: (1..10).to_a.sample,
        valor_parcial: (1..1000).to_a.sample / 100.0,
        produtos_id: produto_id,
        vendas_id: venda_id
      )
      puts count
      count = count + 1
    end
    count = 0
    puts "Finished seeding Itens."

    puts "Seeding Produtos..."
    fornecedor_ids = Fornecedor.pluck(:id)
    10_000_000.times do |i|
      Produto.create!(
        descricao: "Produto ##{i + 1}",
        valor: (1..100000).to_a.sample / 100.0,
        quantidade: (1..100).to_a.sample,
        fornecedores_id: fornecedor_ids.sample
      )
      puts count
      count = count + 1
    end
    count = 0
    puts "Finished seeding Produtos."

    puts "Seeding Vendas..."
    funcionario_ids = Funcionario.pluck(:id)
    10_000_000.times do |i|
      Venda.create!(
        horario_venda: Time.now - (1..1000).to_a.sample.days,
        total: (1..100000).to_a.sample / 100.0,
        funcionarios_id: funcionario_ids.sample
      )
      puts count
      count = count + 1
    end
    count = 0
    puts "Finished seeding Vendas."
  end
end