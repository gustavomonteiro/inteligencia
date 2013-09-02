require 'rubygems'
require 'mechanize'
require 'nokogiri'
require 'open-uri'
require 'pg'


url = "http://www.anp.gov.br/preco/prc/Resumo_Por_Estado_Municipio.asp"

agent = Mechanize.new

# 737*De 28/07/2013 a 03/08/2013

def pesquisa(dia, mes, ano,)

  parameters = {:selSemana => '739*De+14%2F07%2F2013+a+20%2F07%2F2013',
    :desc_semana => 'de+14%2F07%2F2013+a+20%2F07%2F2013',
    :cod_Semana => '739',
    :tipo => '1',
    :Cod_Combustivel => 'undefined',
    :selEstado => 'PE*PERNAMBUCO',
    :selCombustivel => '487*Gasolina',
  }

end

puts parameters[:desc_semana]

semana_inicio = URI.unescape(parameters[:desc_semana]).split('+')[1]
semana_fim    = URI.unescape(parameters[:desc_semana]).split('+')[3]

puts semana_inicio
puts semana_fim

page = agent.post(url, parameters)

extrair = page.parser

conn = PGconn.connect("localhost", 5432, '', '', "total", "postgres", "12345")

extrair.css('.linkpadrao').each do |municipio|
  nome                       = municipio.text
  postos_pesquisados         = (municipio.parent.search('~ td').map &:text)[0].gsub("," , ".")
  consumidor_preco_medio     = (municipio.parent.search('~ td').map &:text)[1].gsub("," , ".")
  if consumidor_preco_medio == " - "
    consumidor_preco_medio = 0.0
  else
    consumidor_preco_medio     = (municipio.parent.search('~ td').map &:text)[1].gsub("," , ".")
  end
  consumidor_desvio_padrao   = (municipio.parent.search('~ td').map &:text)[2].gsub("," , ".")
  consumidor_preco_minimo    = (municipio.parent.search('~ td').map &:text)[3].gsub("," , ".")
  consumidor_preco_maximo = (municipio.parent.search('~ td').map &:text)[4].gsub("," , ".") 
  if consumidor_preco_maximo == " - "
    consumidor_preco_maximo = 0.0
  else
    consumidor_preco_maximo = (municipio.parent.search('~ td').map &:text)[4].gsub("," , ".") 
  end
  distribuidor_margem_media  = (municipio.parent.search('~ td').map &:text)[5].gsub("," , ".")
  if distribuidor_margem_media == " - "
    distribuidor_margem_media = 0.0
  else
    distribuidor_margem_media  = (municipio.parent.search('~ td').map &:text)[5].gsub("," , ".")
  end
  distribuidor_preco_medio   = (municipio.parent.search('~ td').map &:text)[6].gsub("," , ".")
  if distribuidor_preco_medio == " - "
    distribuidor_preco_medio = 0.0
  else
    distribuidor_preco_medio   = (municipio.parent.search('~ td').map &:text)[6].gsub("," , ".")
  end
  distribuidor_desvio_padrao = (municipio.parent.search('~ td').map &:text)[7].gsub("," , ".")
  if distribuidor_desvio_padrao == " - "
    distribuidor_desvio_padrao = 0.0
  else
    distribuidor_desvio_padrao = (municipio.parent.search('~ td').map &:text)[7].gsub("," , ".")
  end
  distribuidor_preco_minimo  = (municipio.parent.search('~ td').map &:text)[8].gsub("," , ".")
  if distribuidor_preco_minimo == " - "
    distribuidor_preco_minimo = 0.0
  else
    distribuidor_preco_minimo  = (municipio.parent.search('~ td').map &:text)[8].gsub("," , ".")
  end
  distribuidor_preco_maximo  = (municipio.parent.search('~ td').map &:text)[9].gsub("," , ".")
  if distribuidor_preco_maximo == " - "
    distribuidor_preco_maximo = 0.0
  else
    distribuidor_preco_maximo  = (municipio.parent.search('~ td').map &:text)[9].gsub("," , ".")
  end
  sql =  "INSERT INTO municipios (postos_pesquisados, consumidor_preco_medio, consumidor_desvio_padrao, consumidor_preco_minimo, consumidor_preco_maximo, distribuidor_margem_media, distribuidor_preco_medio, distribuidor_desvio_padrao, distribuidor_preco_minimo, distribuidor_preco_maximo, created_at, updated_at, nome, semana_inicio, semana_fim) VALUES "
  sql += " (#{postos_pesquisados}, #{consumidor_preco_medio}, #{consumidor_desvio_padrao}, '#{consumidor_preco_minimo}', '#{consumidor_preco_maximo}', "
  sql += " '#{distribuidor_margem_media}', '#{distribuidor_preco_medio}', '#{distribuidor_desvio_padrao}', "
  sql += " '#{distribuidor_preco_minimo}', '#{distribuidor_preco_maximo}', now(), now(), '#{nome}', '#{semana_inicio}', '#{semana_fim}')"
  #conn.exec(sql)
  #puts sql
end