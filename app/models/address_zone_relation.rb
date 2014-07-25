class AddressZoneRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :address_id
  belongs_to :zone_id
end
