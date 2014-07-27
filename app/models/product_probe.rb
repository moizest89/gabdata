class ProductProbe
  include Mongoid::Document

  field :_id, type: String
  field :created_at, type: Date
  field :offer_price, type: String
  field :price, type: String
  field :probe_date, type: String
  field :product_brand_id, type: String
  field :product_id, type: String
  field :product_presentation_id, type: String
  field :shopping_establishment_id, type: String
  field :updated_at, type: Date
end
