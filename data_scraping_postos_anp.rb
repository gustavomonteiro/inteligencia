# encoding: UTF-8
require 'mechanize'
require 'nokogiri'
require 'open-uri'

url = "http://www.anp.gov.br/preco/prc/Resumo_Semanal_Posto.asp"

agent = Mechanize.new

parameters = {:cod_semana  		=> '742',
    		  :desc_semana 		=> 'De+01%2F09%2F2013+a+07%2F09%2F2013',
    		  :cod_combustivel  => '487',
    		  :desc_combustivel => '+-+Gasolina+R%24%2Fl',
    		  :selMunicipio 	=> '5406*RECIFE',
    		  :tipo 			=> '1',
  }

page = agent.post(url, parameters)

extrair = page.parser

# conn = PGconn.connect("localhost", 5432, '', '', "total", "postgres", "postgres")

extrair.css('.linkpadrao').each do |posto|
  
	nome 			= (posto.parent.parent.search('td').map &:text)[0]
	endereco 		= (posto.parent.parent.search('td').map &:text)[1]
	bairro 			= (posto.parent.parent.search('td').map &:text)[2]
	distribuidora 	= ((posto.parent.parent.search('td').map &:text)[3]).capitalize.split(' ')[0]
	GasStation.find_or_create_by_nome(nome).update_attributes(
	  :endereco => endereco, :bairro => bairro, :distribuidora => distribuidora, 
	  :municipio => "Recife", :estado => "Pernambuco")

  gas_station = GasStation.find_by_nome(nome)

  cod_semana = parameters[:cod_semana]
	preco_venda 	= (posto.parent.parent.search('td').map &:text)[4].gsub("," , ".") 
	preco_compra 	= (posto.parent.parent.search('td').map &:text)[5].gsub("," , ".").gsub(" - ","0.0")
	modalidade 		= (posto.parent.parent.search('td').map &:text)[6].gsub("-" , "N/A") 
	fornecedor 		= (posto.parent.parent.search('td').map &:text)[7].capitalize.split(' ')[0].gsub("-" , "N/A") 
	data 	= Date.parse((posto.parent.parent.search('td').map &:text)[8])
	
	location = Location.new
	location.address = gas_station.complete_address
	location.gas_station_id = gas_station.id
	location.save!

  WeekCollection.find_or_create_by_cod_semana_and_gas_station_id(cod_semana, gas_station.id).update_attributes(
	  :preco_venda => preco_venda, :preco_compra => preco_compra, :modalidade => modalidade, 
	  :fornecedor => fornecedor, :data => data, :gas_station_id => gas_station.id)
end

l = Location.new
l.address = "Recife - Pernambuco"
l.save!
	

