class CreateGasStations < ActiveRecord::Migration
  def change
    create_table :gas_stations do |t|
      t.string :nome
      t.string :endereco
      t.string :bairro
      t.string :distribuidora

      t.timestamps
    end
  end
end
