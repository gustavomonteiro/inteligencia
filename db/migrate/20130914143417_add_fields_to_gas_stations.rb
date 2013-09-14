class AddFieldsToGasStations < ActiveRecord::Migration
  def change
    add_column :gas_stations, :estado, :string
    add_column :gas_stations, :municipio, :string
  end
end
