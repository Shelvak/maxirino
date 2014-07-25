class AddressConceptualizationRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :address
  belongs_to :conceptualization
end
