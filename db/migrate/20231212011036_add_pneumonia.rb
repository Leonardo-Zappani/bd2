class AddPneumonia < ActiveRecord::Migration[7.0]
  def change
    add_column :funcionarios, :funcao_cd, :string
    add_column :produtos, :produto_id, :integer, array: true, default: []
  end
end
