class Person < ActiveRecord::Base
  has_paper_trail
  has_magick_columns first_name: :string, last_name: :string

  SEX = {
    true => 'male',
    false => 'female'
  }

  has_many :attaches
  has_many :address_person_relations
  has_many :addresses, through: :address_person_relations
  has_many :address_link_kinds, through: :address_person_relations
  has_many :conceptualization_person_relations
  has_many :conceptualizations, through: :conceptualization_person_relations
  has_one  :identification
  has_many :investigation_person_relations
  has_many :investigations, through: :investigation_person_relations
  has_many :person_addresses
  has_many :person_physical_features
  has_many :physical_feature, through: :person_physical_features
  has_many :people
  has_many :phones
  has_many :action_zone_person_relations
  has_many :action_zones, through: :action_zone_person_relations

  validates :first_name, :alias, length: { maximum: 100 }
  validates :last_name, :father, :mother, length: { maximum: 60 }

  accepts_nested_attributes_for :identification
  accepts_nested_attributes_for :person_addresses, allow_destroy: true,
    reject_if: -> (attrs) { attrs[:street_name].blank? && attrs[:street_number].blank? }
  accepts_nested_attributes_for :phones, allow_destroy: true
    #reject_if: -> (attrs) { attrs[:street_name].blank? && attrs[:street_number].blank? }
  accepts_nested_attributes_for :action_zone_person_relations, allow_destroy: true
  accepts_nested_attributes_for :conceptualization_person_relations, allow_destroy: true
  accepts_nested_attributes_for :attaches, allow_destroy: true


  def initialize(attrs = nil)
    super(attrs)

    self.build_identification unless self.identification
    self.person_addresses.build unless self.person_addresses.any?
  end

  def sex_to_s
    I18n.t('view.people.sex.' + SEX[self.sex])
  end

  def self.filtered_list(query)
    query.present? ? magick_search(query) : all
  end

  def to_s
    [self.first_name, self.last_name].compact.join(' ')
  end

  alias_method :label, :to_s

  def informal
    self.alias
  end

  def as_json(options = nil)
    default_options = {
      only: [:id],
      methods: [:label, :informal]
    }

    super(default_options.merge(options || {}))
  end
end
