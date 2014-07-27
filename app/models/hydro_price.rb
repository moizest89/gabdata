class HydroPrice
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :hydro_establishment_id, type: String
  field :price, type: Float
  field :price_at, type: Date
  field :product_code, type: String
  field :service_code, type: String
  field :updated_at, type: Date
end
