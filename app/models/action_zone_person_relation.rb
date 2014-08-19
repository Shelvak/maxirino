class ActionZonePersonRelation < ActiveRecord::Base
  has_paper_trail

  belongs_to :person
  belongs_to :action_zone

  attr_accessor :auto_name
end
