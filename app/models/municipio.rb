class Municipio < ActiveRecord::Base
  attr_accessible :consumidor_desvio_padrao, :consumidor_preco_maximo, :consumidor_preco_medio, :consumidor_preco_minimo, :distribuidor_desvio_padrao, :distribuidor_margem_media, :distribuidor_preco_maximo, :distribuidor_preco_medio, :distribuidor_preco_minimo, :postos_pesquisados
end
