class WeekCollection < ActiveRecord::Base
  belongs_to :gas_station
  attr_accessible :cod_semana, :data, :fornecedor, :gas_station_id, :modalidade, :preco_compra, :preco_venda

  validates_presence_of :gas_station_id, :cod_semana
end
