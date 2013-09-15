class AddGasStationIdToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :gas_station_id, :integer
    add_index :locations, :gas_station_id
  end
end
