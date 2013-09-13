require 'foursquare2'

client = Foursquare2::Client.new(:client_id => 'VLRJQFUOZTUWIK10VPZ2NJ30DS3YLKV5YM3LMPQBUEPUCOV2', :client_secret => 'H1VJIR342MRT4CZSEFJ0XPPVEVG5WQP0YWA02LS03MHUSMLA')

postos = client.search_venues(:near => "Pernambuco", :query => "Posto Total")

puts postos