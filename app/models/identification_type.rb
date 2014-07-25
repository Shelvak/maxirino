class IdentificationType < ActiveRecord::Base
  has_paper_trail

  has_many :identifications
  has_many :people, through: :identifications
end
