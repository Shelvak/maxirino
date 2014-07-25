class City < ActiveRecord::Base
  has_paper_trail

  belongs_to :province
  has_many :person_addresses
end
