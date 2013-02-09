class Shortcut
  include Mongoid::Document

  field :headline,       type: String
  field :url,            type: String
  field :color,          type: Symbol, default: :none
  field :sublinks_panel, type: Symbol, default: :always_open
  field :favicon,        type: String

  attr_accessible :headline, :url, :color, :column_id, :sublinks_panel

  belongs_to :column
  belongs_to :user

  validates_inclusion_of :color, in: [:none, :blue, :red, :green, :yellow, :orange, :black]
  validates_inclusion_of :sublinks_panel, in: [:always_open, :auto, :toggle]
  validates_presence_of :headline
  validates_presence_of :url
  validates_presence_of :column
end