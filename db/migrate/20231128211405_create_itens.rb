class CreateItens < ActiveRecord::Migration[7.0]
  def change
    create_table :itens do |t|

      t.timestamps
    end
  end
end
