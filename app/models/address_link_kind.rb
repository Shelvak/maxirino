class AddressLinkKind < ActiveRecord::Base
  has_paper_trail

  has_many :address_person_relations
  has_many :addresses, through: :address_person_relations
  has_many :people, through: :address_person_relations
end
