class Phone < ActiveRecord::Base
  has_paper_trail

  belongs_to :person

  validates :number, length: { maximum: 36 }, presence: true
  validates :number, uniqueness: { scope: :person_id }

end
