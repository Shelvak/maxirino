class LeaderPersonRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :person
  belongs_to :leader
end
