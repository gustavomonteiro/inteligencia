# encoding: UTF-8

require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'pg'


#cod_semana=742
#desc_semana=De+01%2F09%2F2013+a+07%2F09%2F2013
#cod_combustivel=487
#desc_combustivel=+-+Gasolina+R%24%2Fl
#selMunicipio=5406*RECIFE
#tipo=1

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

conn = PGconn.connect("localhost", 5432, '', '', "total", "postgres", "12345")

extrair.css('.linkpadrao').each do |posto|
	nome 			= (posto.parent.parent.search('td').map &:text)[0]
	endereco 		= (posto.parent.parent.search('td').map &:text)[1]
	bairro 			= (posto.parent.parent.search('td').map &:text)[2]
	distribuidora 	= ((posto.parent.parent.search('td').map &:text)[3]).capitalize.split(' ')[0]
	preco_venda 	= (posto.parent.parent.search('td').map &:text)[4].gsub("," , ".") 
	preco_compra 	= (posto.parent.parent.search('td').map &:text)[5].gsub("," , ".").gsub(" - ","0.0")
	modalidade 		= (posto.parent.parent.search('td').map &:text)[6].gsub("-" , "N/A") 
	fornecedor 		= (posto.parent.parent.search('td').map &:text)[7].capitalize.split(' ')[0].gsub("-" , "N/A") 
	data_coleta 	= (posto.parent.parent.search('td').map &:text)[8]

	sql =  "INSERT INTO postos (nome, endereco, bairro, distribuidora, preco_venda, preco_compra, modalidade, fornecedor, data_coleta, created_at, updated_at) VALUES "
	sql += " ('#{nome}', '#{endereco}', '#{bairro}', '#{distribuidora}', '#{preco_venda}', '#{preco_compra}', '#{modalidade}', '#{fornecedor}', '#{data_coleta}', now(), now())"
	conn.exec(sql)
end
	




