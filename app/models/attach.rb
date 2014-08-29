class Attach < ActiveRecord::Base
  has_paper_trail
  mount_uploader :file, FileUploader

  has_many :attach_details
  belongs_to :attach_type
  belongs_to :person
end
