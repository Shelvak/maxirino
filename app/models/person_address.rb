class PersonAddress < ActiveRecord::Base
  has_paper_trail

  belongs_to :person
  belongs_to :address
  belongs_to :country
  belongs_to :province
  belongs_to :city
  belongs_to :zone

  attr_accessor :auto_zone_name
end
