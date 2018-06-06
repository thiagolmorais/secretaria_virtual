# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180606124605) do

  create_table "configuracaos", force: :cascade do |t|
    t.integer "duracao_consulta"
    t.integer "periodo_reajuste"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "consulta", force: :cascade do |t|
    t.date "data"
    t.boolean "status", default: false
    t.integer "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "competencia"
    t.time "hora_inicial"
    t.time "hora_final"
    t.decimal "valor"
    t.integer "precos_id"
    t.index ["paciente_id"], name: "index_consulta_on_paciente_id"
    t.index ["precos_id"], name: "index_consulta_on_precos_id"
  end

  create_table "faturas", force: :cascade do |t|
    t.date "vencimento"
    t.boolean "status", default: false
    t.decimal "valor"
    t.integer "competencia"
    t.integer "consulta_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consulta_id"], name: "index_faturas_on_consulta_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome"
    t.string "telefone"
    t.text "observacao"
    t.string "email"
    t.date "nascimento"
    t.string "sexo"
    t.date "paciente_desde"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
    t.integer "dia_vencimento"
  end

  create_table "pagamentos", force: :cascade do |t|
    t.decimal "valor"
    t.date "data"
    t.integer "competencia"
    t.integer "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false
    t.index ["paciente_id"], name: "index_pagamentos_on_paciente_id"
  end

  create_table "precos", force: :cascade do |t|
    t.decimal "valor"
    t.date "reajuste"
    t.integer "paciente_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_precos_on_paciente_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "usuario"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
