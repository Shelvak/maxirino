class InvestigationStatus < ActiveRecord::Base
  has_paper_trail

  has_many :investigations, foreign_key: 'status_id'

  validates :name, length: { maximum: 30 }
end
