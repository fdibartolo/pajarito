class Image
  include Mongoid::Document
  field :path, type: String
  field :categories, type: String
  field :visible, type: Boolean, default: false

  scope :active, ->{ where(visible: true) }
end
