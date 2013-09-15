class Location < ActiveRecord::Base
  belongs_to :gas_station
  attr_accessible :address, :latitude, :longitude
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?  
end
