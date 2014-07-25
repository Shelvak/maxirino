class PeopleRelationKind < ActiveRecord::Base
  has_paper_trail

  has_many :person_person_relations, foreign_key: :link_kind_id
end
