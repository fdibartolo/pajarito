class Inquiry
  include Mongoid::Document
  field :name, type: String
  field :email, type: String
  field :body, type: String
end
