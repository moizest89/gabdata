class InformationOfficer
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :created_at, type: Date
  field :email, type: String
  field :institution_id, type: String
  field :latitude, type: String
  field :longitude, type: String
  field :name, type: String
  field :phone, type: String
  field :updated_at, type: Date
end
