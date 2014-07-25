class InvestigationPersonRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :investigation
  belongs_to :person
end
