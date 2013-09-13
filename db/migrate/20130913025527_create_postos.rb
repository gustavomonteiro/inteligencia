class CreatePostos < ActiveRecord::Migration
  def change
    create_table :postos do |t|
      t.string :nome
      t.string :endereco
      t.string :bairro
      t.string :distribuidora
      t.decimal :preco_venda
      t.decimal :preco_compra
      t.string :modalidade
      t.string :fornecedor
      t.string :data_coleta

      t.timestamps
    end
  end
end
