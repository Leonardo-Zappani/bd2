class CreateFornecedores < ActiveRecord::Migration[7.0]
  def change
    create_table :fornecedores do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
