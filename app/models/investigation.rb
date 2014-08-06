class Investigation < ActiveRecord::Base
  has_paper_trail

  belongs_to :category, class: InvestigationCategory
  belongs_to :status, class: InvestigationStatus
  has_many :investigation_person_relations
  has_many :people, through: :investigation_person_relations
  has_many :investigation_address_relations
  has_many :addresses, through: :investigation_address_relations

  attr_accessor :auto_name, :autocomplete_ids

  validates :title, presence: true
end
