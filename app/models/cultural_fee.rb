class CulturalFee
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String
  field :created_at, type: Date
  field :cultural_fee_place_id, type: Integer
  field :cultural_fee_price_type_id, type: Integer
  field :cultural_fee_type_id, type: Integer
  field :description, type: String
  field :max_price, type: Float
  field :min_price, type: Float
  field :updated_at, type: Date

  searchable do
    text :description
  end

end
