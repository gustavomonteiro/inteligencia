class Posto < ActiveRecord::Base
  attr_accessible :bairro, :data_coleta, :distribuidora, :endereco, :fornecedor, :modalidade, :nome, :preco_compra, :preco_venda
end
