class DelegationInfo
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :address, type: String
  field :area, type: String
  field :created_at, type: Date
  field :delegation_id, type: Integer
  field :name, type: String
  field :phone, type: String
  field :updated_at, type: Date

  searchable do
    string :name
  end

end
