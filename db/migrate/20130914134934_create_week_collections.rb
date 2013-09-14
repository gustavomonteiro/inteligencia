class CreateWeekCollections < ActiveRecord::Migration
  def change
    create_table :week_collections do |t|
      t.integer :cod_semana
      t.decimal :preco_venda
      t.decimal :preco_compra
      t.string :modalidade
      t.string :fornecedor
      t.date :data
      t.integer :gas_station_id

      t.timestamps
    end
    add_index :week_collections, :gas_station_id
  end
end
