class Product
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code, type: String
  field :created_at, type: Date
  field :name, type: String
  field :product_category_id, type: String
  field :slug, type: String
  field :updated_at, type: Date
end
