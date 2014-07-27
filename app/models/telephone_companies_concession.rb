class TelephoneCompaniesConcession
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code1, type: String
  field :code2, type: String
  field :code3, type: String
  field :created_at, type: Date
  field :name, type: String
  field :registered_at, type: String
  field :updated_at, type: Date
end
