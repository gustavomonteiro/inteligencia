class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.integer :postos_pesquisados
      t.decimal :consumidor_preco_medio
      t.decimal :consumidor_desvio_padrao
      t.decimal :consumidor_preco_minimo
      t.decimal :consumidor_preco_maximo
      t.decimal :distribuidor_margem_media
      t.decimal :distribuidor_preco_medio
      t.decimal :distribuidor_desvio_padrao
      t.decimal :distribuidor_preco_minimo
      t.decimal :distribuidor_preco_maximo

      t.timestamps
    end
  end
end
