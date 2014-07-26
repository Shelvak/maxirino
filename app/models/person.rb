class Person < ActiveRecord::Base
  has_paper_trail

  SEX = {
    true => 'male',
    false => 'female'
  }

  has_many :address_person_relations
  has_many :addresses, through: :address_person_relations
  has_many :address_link_kinds, through: :address_person_relations
  has_many :conceptualization_person_relations
  has_many :conceptualizations, through: :conceptualization_person_relations
  has_one :identification
  has_many :investigation_person_relations
  has_many :investigations, through: :investigation_person_relations
  has_many :person_addresses
  has_many :person_physical_features
  has_many :physical_feature, through: :person_physical_features
  has_many :people

  validates :first_name, :alias, length: { maximum: 100 }
  validates :last_name, :father, :mother, length: { maximum: 60 }

  def sex_to_s
    I18n.t('.' + SEX[self.sex])
  end
end
