class SolventCompany
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code, type: String
	field :name, type: String
	field :sector, type: String
	field :period, type: String
	field :created_at, type: Date
	field :updated_at, type: Date
  
  searchable do
    string :code
    string :name
    string :sector
  end

end
