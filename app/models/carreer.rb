class Carreer
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :code, type: String
  field :created_at, type: Date
  field :name, type: String
  field :university_id, type: Integer
  field :updated_at, type: Date
  
  searchable do
    string :name
  end
end
