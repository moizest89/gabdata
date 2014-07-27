class LineOfWork
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :budget_unit_id, type: String
  field :code, type: String
  field :created_at, type: Date
  field :digit, type: String
  field :name, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
  end

end
