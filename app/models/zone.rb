class Zone < ActiveRecord::Base
  has_paper_trail
  has_magick_columns name: :string

  has_many :address_zone_relations
  has_many :addresses, through: :address_zone_relations
  has_many :person_addresses

  def self.filtered_list(query)
    query.present? ? magick_search(query) : all
  end

  def to_s
    self.name
  end

  alias_method :label, :to_s

  def as_json(options = nil)
    default_options = {
      only: [:id],
      methods: [:label]
    }

    super(default_options.merge(options || {}))
  end
end
