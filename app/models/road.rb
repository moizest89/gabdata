class Road
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :end, type: String
  field :longitude, type: String
  field :name, type: String
  field :number, type: String
  field :responsible, type: String
  field :slug, type: String
  field :start, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :number
    string :responsible
  end
end
