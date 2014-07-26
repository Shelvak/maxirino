class AddressLinkKind < ActiveRecord::Base
  has_paper_trail

  validates :name, presence: true, uniqueness: true

  has_many :address_person_relations
  has_many :addresses, through: :address_person_relations
  has_many :people, through: :address_person_relations
end
