class ConceptualizationPersonRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :person
  belongs_to :conceptualization
end
