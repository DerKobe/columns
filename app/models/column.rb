class Column
  include Mongoid::Document

  field :title, type: String
  field :position, type: Integer

  attr_accessible :title

  belongs_to :user
  has_many :shortcuts

  validates_presence_of :title
  validates_presence_of :user
  validates_presence_of :position
  validates_uniqueness_of :position

  before_validation :get_position

  private

  def get_position
    self.position = user.columns.count unless position || persisted?
  end
end