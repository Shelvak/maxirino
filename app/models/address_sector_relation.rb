class AddressSectorRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :address
  belongs_to :sector
end
