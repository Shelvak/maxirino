class InvestigationStatus < ActiveRecord::Base
  has_paper_trail

  has_many :investigations, foreign_key: 'status_id'
end
