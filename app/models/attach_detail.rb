class AttachDetail < ActiveRecord::Base
  has_paper_trail

  belongs_to :attach
end
