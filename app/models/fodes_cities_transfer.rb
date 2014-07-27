class FodesCitiesTransfer
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String
  field :city_id, type: Integer
  field :created_at, type: Date
  field :period_1, type: String
  field :period_2, type: String
  field :updated_at, type: Date
  field :year, type: String

  searchable do
  	integer :city_id
  end
end
