class Shortcut
  include Mongoid::Document

  field :headline, type: String
  field :url,      type: String
  field :color,    type: String, default: 'none'

  attr_accessible :headline, :url, :color

  validates_inclusion_of :color, in: %w{none blue red green yellow orange black}
  validates_presence_of :headline
  validates_presence_of :url
end