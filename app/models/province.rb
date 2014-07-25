class Province < ActiveRecord::Base
  has_paper_trail

  has_many :cities
  has_many :person_addresses
  belongs_to :country
end
