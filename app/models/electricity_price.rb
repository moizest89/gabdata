class ElectricityPrice
  include Mongoid::Document
  field :_id, type: String
  field :created_at, type: Date
  field :electricity_charge_type_id, type: Integer
  field :electricity_company_id, type: Integer
  field :electricity_rate_type_id, type: Integer
  field :price, type: Float
  field :updated_at, type: Date
end
