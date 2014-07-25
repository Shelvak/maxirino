class Town < ActiveRecord::Base
  has_paper_trail

  belongs_to :city
end
