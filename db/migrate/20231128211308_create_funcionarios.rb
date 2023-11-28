class CreateFuncionarios < ActiveRecord::Migration[7.0]
  def change
    create_table :funcionarios do |t|

      t.timestamps
    end
  end
end
