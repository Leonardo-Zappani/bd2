class CreateVendas < ActiveRecord::Migration[7.0]
  def change
    create_table :vendas do |t|

      t.timestamps
    end
  end
end
