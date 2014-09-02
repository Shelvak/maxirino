class Leader < ActiveRecord::Base
  has_paper_trail
  has_magick_columns name: :string

  attr_accessor :auto_name

  validates :name, presence: true

  def self.filtered_list(query)
    query ? magick_search(query) : all
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
