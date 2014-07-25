class AttachType < ActiveRecord::Base
  has_paper_trail

  has_many :attaches
end
