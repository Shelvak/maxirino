class InvestigationCategory < ActiveRecord::Base
  has_paper_trail

  has_many :investigations, foreign_key: 'category_id'
end
