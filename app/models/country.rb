class Country < ActiveRecord::Base
  has_paper_trail
  has_many :person_addresses
end
