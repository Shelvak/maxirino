class PersonPhysicalFeature < ActiveRecord::Base
  has_paper_trail

  belongs_to :person
  belongs_to :physical_feature
end
