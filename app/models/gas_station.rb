class GasStation < ActiveRecord::Base
  has_many :week_collections, :dependent => :destroy
  has_one :location, :dependent => :destroy

  attr_accessible :bairro, :distribuidora, :endereco, :nome, :municipio, :estado
  
  validates_presence_of :nome
  
  def self.search(search)
    if (search && search.strip.length > 0)
      search = search.downcase
      search = "'%"+ search + "%'"
      joins(:week_collections).where("lower(estado) LIKE #{search} OR lower(municipio) LIKE #{search}
      OR lower(bairro) LIKE #{search}").order('week_collections.preco_venda DESC')
    else
      joins(:week_collections).order('week_collections.preco_venda DESC')
    end
  end
  
  def complete_address
    "#{endereco}, #{bairro}, #{municipio} - #{estado}"
  end
  
end
