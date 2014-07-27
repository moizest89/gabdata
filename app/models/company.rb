class Company
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :legal_representative, type: String
  field :name, type: String
  field :slug, type: String
  field :state_id, type: Integer
  field :updated_at, type: Date

  searchable do
    string :name
  end
end
