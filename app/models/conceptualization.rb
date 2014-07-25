class Conceptualization < ActiveRecord::Base
  has_paper_trail

  has_many :conceptualization_person_relations
  has_many :people, through: :conceptualization_person_relations
end
