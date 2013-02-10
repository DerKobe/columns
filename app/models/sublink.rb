class Sublink
  include Mongoid::Document

  field :title, type: String
  field :url,   type: String

  embedded_in :shortcut
end