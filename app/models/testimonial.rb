class Testimonial
  include Mongoid::Document
  field :author, type: String
  field :description, type: Hash #localize: true
end
