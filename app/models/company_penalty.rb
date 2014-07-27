class CompanyPenalty
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String
  field :absolved, type: Boolean
  field :company_id, type: Integer
  field :created_at, type: Date
  field :men_number, type: Integer
  field :month, type: Integer
  field :offenses, type: Integer
  field :penalties_amount, type: Float
  field :penalties_number, type: Integer
  field :updated_at, type: Date
  field :women_number, type: Integer
  field :year, type: Integer
end
