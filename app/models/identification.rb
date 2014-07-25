class Identification < ActiveRecord::Base
  has_paper_trail

  belongs_to :person
  belongs_to :identification_type
end
