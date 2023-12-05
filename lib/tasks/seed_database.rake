namespace :db do
  desc "Seed fornecedores, funcionarios, itens, produtos, and vendas with 1 million records each"
  task seed_models: :environment do
    count = 0

    puts "Seeding Fornecedores..."
      fornecedores = []
      1000000.times do |j|
        fornecedores << Fornecedore.new(descricao: Faker::Name.name)
        puts count
        count = count + 1
      end
      Fornecedore.import fornecedores
      count = 0
      puts "Finished seeding Fornecedores."


    puts "Seeding Funcionarios..."
    funcionarios = []
    1000000.times do |j|
      funcionarios <<    Funcionario.new(
        nome:Faker::Name.name,
        cpf: Faker::Number.number(digits: 11),
        senha: Faker::ProgrammingLanguage.name,
        funcao: Faker::Job.name,
      )
      puts count
      count = count + 1
    end
    Funcionario.import funcionarios
    count = 0

    puts "Finished seeding Funcionarios."

    puts "Seeding Itens..."
    produtos = []
    1000000.times do |j|
      produto_id = Produto.order("RANDOM()").limit(1).pluck(:id).first
      venda_id = Venda.order("RANDOM()").limit(1).pluck(:id).first
      produtos << Iten.new(
        quantidade: (1..10).to_a.sample,
        valor_parcial: (1..1000).to_a.sample / 100.0,
        produtos_id: produto_id,
        vendas_id: venda_id
      )
      puts count
      count = count + 1
    end
    Iten.import produtos
    count = 0
    puts "Finished seeding Itens."

    puts "Seeding Produtos..."
    fornecedor_ids = Fornecedor.pluck(:id)
      produtos = []
      1000000.times do |j|
        produtos << Produto.new(
          descricao: Faker::FunnyName.name,
          valor: (1..100000).to_a.sample / 100.0,
          quantidade: (1..100).to_a.sample,
          fornecedores_id: fornecedor_ids.sample
        )
        puts count
        count = count + 1
      end
      Produto.import produtos
    count = 0
    puts "Finished seeding Produtos."

    puts "Seeding Vendas..."
    funcionario_ids = Funcionario.pluck(:id)
      produtos = []
      1000000.times do |j|
        produtos <<      Venda.new(
          horario_venda: Time.now - (1..1000).to_a.sample.days,
          total: (1..100000).to_a.sample / 100.0,
          funcionarios_id: funcionario_ids.sample
        )
        puts count
        count = count + 1
      end
      Venda.import produtos
      puts "Finished seeding Vendas."
  end
end