class Shortcut
  include Mongoid::Document

  field :headline,  type: String
  field :url,       type: String
  field :color,     type: String, default: 'none'
  field :auto_open, type: Boolean, default: false

  attr_accessible :headline, :url, :color, :column, :auto_open

  belongs_to :column

  validates_inclusion_of :color, in: %w{none blue red green yellow orange black}
  validates_presence_of :headline
  validates_presence_of :url
  validates_presence_of :column
end