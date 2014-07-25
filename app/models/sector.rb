class Sector < ActiveRecord::Base
  has_paper_trail

  has_many :address_sector_relations
  has_many :addresses, through: :address_sector_relations
end
