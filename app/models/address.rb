class Address < ActiveRecord::Base
  has_paper_trail

  belongs_to :address_type
  has_many :address_conceptualization_relations
  has_many :conceptualizations, through: :address_conceptualization_relations
  has_many :address_person_relations
  has_many :people, through: :address_person_relations
  has_many :address_sector_relations
  has_many :sectors, through: :address_sector_relations
  has_many :address_zone_relations
  has_many :zones, through: :address_zone_relations
  has_many :person_addresses
end
