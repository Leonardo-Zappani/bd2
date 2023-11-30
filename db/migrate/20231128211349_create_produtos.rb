class CreateProdutos < ActiveRecord::Migration[7.0]
  def change
    create_table :produtos do |t|
      t.string :descricao
      t.decimal :valor, precision: 7, scale: 2
      t.integer :quantidade
      t.references :fornecedores, :integer

      t.timestamps
    end
  end
end
