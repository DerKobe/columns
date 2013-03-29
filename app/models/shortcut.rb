require 'pismo'
require 'timeout'

class Shortcut
  include Mongoid::Document
  include Mongoid::Timestamps

  field :position,       type: Integer
  field :headline,       type: String
  field :url,            type: String
  field :color,          type: Symbol, default: :none
  field :sublinks_panel, type: Symbol, default: :off
  field :favicon,        type: String

  attr_accessible :headline, :url, :color, :column_id, :sublinks_panel

  belongs_to :column
  belongs_to :user

  embeds_many :sublinks

  validates_inclusion_of :color, in: [:none, :blue, :red, :green, :yellow, :orange, :black]
  validates_inclusion_of :sublinks_panel, in: [:off, :always_open, :auto, :toggle]
  validates_presence_of :headline
  validates_presence_of :url
  validates_presence_of :column
  validates_presence_of :position

  before_validation :get_position, :get_favicon

  private

  def get_position
    self.position = Shortcut.where(column_id: column_id).count unless position
  end

  def get_favicon
    begin
      Timeout::timeout(5) {
        doc = Pismo::Document.new url
        self.favicon = doc.favicon if doc.favicon
      }
    rescue Exception => w
      Rails.logger.warn w
    end
  end
end