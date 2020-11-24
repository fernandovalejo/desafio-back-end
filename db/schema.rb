# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_23_235540) do

  create_table "donos", force: :cascade do |t|
    t.string "cpf"
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lojas", force: :cascade do |t|
    t.integer "dono_id", null: false
    t.string "nome"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dono_id"], name: "index_lojas_on_dono_id"
  end

  create_table "tipo_transacoes", force: :cascade do |t|
    t.string "descricao"
    t.boolean "natureza"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transacoes", force: :cascade do |t|
    t.integer "tipo_transacao_id", null: false
    t.integer "loja_id", null: false
    t.datetime "data_hora"
    t.string "cartao"
    t.decimal "valor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loja_id"], name: "index_transacoes_on_loja_id"
    t.index ["tipo_transacao_id"], name: "index_transacoes_on_tipo_transacao_id"
  end

  add_foreign_key "lojas", "donos"
  add_foreign_key "transacoes", "lojas"
  add_foreign_key "transacoes", "tipo_transacoes"
end
