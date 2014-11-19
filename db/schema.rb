# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141108145242) do

  create_table "anuncios", force: true do |t|
    t.string   "descricao"
    t.float    "preco",               limit: 24
    t.string   "titulo"
    t.string   "imagem"
    t.boolean  "favorito"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
    t.integer  "categoria_id"
    t.integer  "user_id"
    t.string   "categoria"
  end

  add_index "anuncios", ["user_id"], name: "index_anuncios_on_user_id", using: :btree

  create_table "cidades", force: true do |t|
    t.string   "cep"
    t.string   "bairro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comentarios", force: true do |t|
    t.string   "nome"
    t.text     "corpo"
    t.integer  "anuncio_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enderecos", force: true do |t|
    t.string   "cep"
    t.string   "bairro"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", force: true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "users", force: true do |t|
    t.string   "nome"
    t.string   "password"
    t.string   "email"
    t.string   "senha_criptografada"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
