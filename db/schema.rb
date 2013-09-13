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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130913025527) do

  create_table "municipios", :force => true do |t|
    t.integer  "postos_pesquisados"
    t.decimal  "consumidor_preco_medio"
    t.decimal  "consumidor_desvio_padrao"
    t.decimal  "consumidor_preco_minimo"
    t.decimal  "consumidor_preco_maximo"
    t.decimal  "distribuidor_margem_media"
    t.decimal  "distribuidor_preco_medio"
    t.decimal  "distribuidor_desvio_padrao"
    t.decimal  "distribuidor_preco_minimo"
    t.decimal  "distribuidor_preco_maximo"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "nome"
    t.string   "semana_inicio"
    t.string   "semana_fim"
  end

  create_table "postos", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "distribuidora"
    t.decimal  "preco_venda"
    t.decimal  "preco_compra"
    t.string   "modalidade"
    t.string   "fornecedor"
    t.string   "data_coleta"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
