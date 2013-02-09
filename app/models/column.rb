class Column
  include Mongoid::Document

  field :title, type: String

  attr_accessible :title

  belongs_to :user
  has_many :shortcuts

  validates_presence_of :title
  validates_presence_of :user
end