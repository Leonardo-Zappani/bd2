class CreateItens < ActiveRecord::Migration[7.0]
  def change
    create_table :itens do |t|
      t.integer :quantidade
      t.decimal :valor_parcial, precision: 7, scale: 2

      t.references :produtos
      t.references :vendas

      t.timestamps
    end
  end
end
