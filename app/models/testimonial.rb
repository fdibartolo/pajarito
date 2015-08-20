class Testimonial
  include Mongoid::Document
  field :author, type: String
  field :description, localize: true
end
