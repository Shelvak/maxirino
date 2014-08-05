class InvestigationCategory < ActiveRecord::Base
  has_paper_trail

  has_many :investigations, foreign_key: 'category_id'

  def to_s
    self.name
  end
end
