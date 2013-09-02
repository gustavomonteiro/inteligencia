require 'foursquare2'
require 'oauth2'

client = OAuth2::Client.new('VLRJQFUOZTUWIK10VPZ2NJ30DS3YLKV5YM3LMPQBUEPUCOV2', 'H1VJIR342MRT4CZSEFJ0XPPVEVG5WQP0YWA02LS03MHUSMLA', :site => 'http://www.runtime.inf.br/inteligencia
')

client.auth_code.authorize_url(:redirect_uri => 'http://localhost:8080/oauth2/callback')
