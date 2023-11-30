class CreateVendas < ActiveRecord::Migration[7.0]
  def change
    create_table :vendas do |t|
      t.timestamp :horario_venda
      t.decimal :total, precision: 7, scale: 2

      t.references :funcionarios, :integer
      t.timestamps
    end
  end
end
