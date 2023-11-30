# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_11_28_211405) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fornecedores", force: :cascade do |t|
    t.string "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcionarios", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "senha"
    t.string "funcao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itens", force: :cascade do |t|
    t.integer "quantidade"
    t.decimal "valor_parcial", precision: 7, scale: 2
    t.bigint "produtos_id"
    t.bigint "vendas_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["produtos_id"], name: "index_itens_on_produtos_id"
    t.index ["vendas_id"], name: "index_itens_on_vendas_id"
  end

  create_table "produtos", force: :cascade do |t|
    t.string "descricao"
    t.decimal "valor", precision: 7, scale: 2
    t.integer "quantidade"
    t.bigint "fornecedores_id"
    t.bigint "integer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fornecedores_id"], name: "index_produtos_on_fornecedores_id"
    t.index ["integer_id"], name: "index_produtos_on_integer_id"
  end

  create_table "vendas", force: :cascade do |t|
    t.datetime "horario_venda", precision: nil
    t.decimal "total", precision: 7, scale: 2
    t.bigint "funcionarios_id"
    t.bigint "integer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["funcionarios_id"], name: "index_vendas_on_funcionarios_id"
    t.index ["integer_id"], name: "index_vendas_on_integer_id"
  end

end
