class HydroEstablishment
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :brand, type: String
  field :created_at, type: Date
  field :hydro_department_id, type: String
  field :hydro_municipality_id, type: String
  field :hydro_zone_id, type: String
  field :latitude, type: String
  field :longitude, type: String
  field :name, type: String
  field :status, type: String
  field :updated_at, type: Date
end
