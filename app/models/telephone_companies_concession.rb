class TelephoneCompaniesConcession
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code1, type: String
  field :code2, type: String
  field :code3, type: String
  field :created_at, type: Date
  field :name, type: String
  field :registered_at, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :code1
    string :code2
    string :code3
  end

end
