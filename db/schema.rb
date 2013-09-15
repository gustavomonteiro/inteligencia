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

ActiveRecord::Schema.define(:version => 20130915151830) do

  create_table "gas_stations", :force => true do |t|
    t.string   "nome"
    t.string   "endereco"
    t.string   "bairro"
    t.string   "distribuidora"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "estado"
    t.string   "municipio"
  end

  create_table "locations", :force => true do |t|
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "gas_station_id"
  end

  add_index "locations", ["gas_station_id"], :name => "index_locations_on_gas_station_id"

  create_table "week_collections", :force => true do |t|
    t.integer  "cod_semana"
    t.decimal  "preco_venda"
    t.decimal  "preco_compra"
    t.string   "modalidade"
    t.string   "fornecedor"
    t.date     "data"
    t.integer  "gas_station_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "week_collections", ["gas_station_id"], :name => "index_week_collections_on_gas_station_id"

end
