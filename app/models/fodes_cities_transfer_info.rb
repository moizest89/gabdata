class FodesCitiesTransferInfo
  include Mongoid::Document

  field :_id, type: String
  field :amount, type: Float
  field :created_at, type: Date
  field :fodes_cities_transfer_id, type: Integer
  field :month, type: Integer
  field :updated_at, type: Date
end
