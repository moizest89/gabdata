class SolventCompany
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code, type: String
	field :name, type: String
	field :sector, type: String
	field :period, type: String
	field :created_at, type: Date
	field :updated_at, type: Date
end
