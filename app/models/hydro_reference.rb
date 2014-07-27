class HydroReference
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :end_at, type: String
  field :hydro_zone_id, type: String
  field :price, type: String
  field :product_code, type: String
  field :service_code, type: String
  field :start_at, type: String
  field :updated_at, type: Date
end
