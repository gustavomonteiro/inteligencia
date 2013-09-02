class AddFieldsToMunicipios < ActiveRecord::Migration
  def change
    add_column :municipios, :semana_inicio, :string
    add_column :municipios, :semana_fim, :string
  end
end
