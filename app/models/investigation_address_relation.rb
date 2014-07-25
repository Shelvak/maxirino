class InvestigationAddressRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :investigation
  belongs_to :address
end
