class DashboardController < ApplicationController
  def index
    @bairro_maior_media = WeekCollection.select('gas_stations.bairro, avg(preco_venda)').joins(:gas_station).group('gas_stations.bairro').order('avg DESC').limit(5)
    @bandeira_maior_media = WeekCollection.select('gas_stations.distribuidora, avg(preco_venda)').joins(:gas_station).group('gas_stations.distribuidora').order('avg DESC').limit(5)
    @maiores_precos_bandeira_branca = GasStation.select('nome, week_collections.preco_compra, week_collections.fornecedor').joins(:week_collections).where("lower(distribuidora) = 'branca'").order('preco_compra DESC').limit(5)
    @menores_precos_bandeira_branca = GasStation.select('nome, week_collections.preco_compra, week_collections.fornecedor').joins(:week_collections).where("lower(distribuidora) = 'branca' AND preco_compra > 0").order('preco_compra ASC').limit(5)
    @top_5_distribuidores = GasStation.select('distribuidora, count(*)').group('distribuidora').order('count DESC').limit(5)
    @top_5_fornecedores = WeekCollection.select('fornecedor, count(*)').group('fornecedor').order('count DESC').limit(5)
  end
end
