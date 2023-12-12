class AddProdutoReference < ActiveRecord::Migration[7.0]
  def change
    add_column :vendas, :produto_id, :integer, array: true, default: [], foreign_key: true
  end
end
