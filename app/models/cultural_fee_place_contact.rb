class CulturalFeePlaceContact
  include Mongoid::Document

  field :_id, type: String
  field :address, type: String
  field :created_at, type: Date
  field :cultural_fee_place_id, type: Integer
  field :phone, type: String
  field :updated_at, type: Date
end
