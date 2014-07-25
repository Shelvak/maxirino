class Zone < ActiveRecord::Base
  has_paper_trail

  has_many :address_zone_relations
  has_many :addresses, through: :address_zone_relations
  has_many :person_addresses
end
