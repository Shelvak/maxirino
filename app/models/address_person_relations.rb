class AddressPersonRelations < ActiveRecord::Base
  has_paper_trail

  belongs_to :person
  belongs_to :address
  belongs_to :address_link_kind
end
