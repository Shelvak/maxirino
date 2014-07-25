class PersonPersonRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :person_1
  belongs_to :person_2
  belongs_to :link_kind, class: :people_relation_kinds
end
