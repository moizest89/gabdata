class Doctor
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :created_at, type: Date
  field :doctor_especiality_id, type: Integer
  field :name, type: String
  field :overdue, type: Boolean
  field :register_number, type: Integer
  field :slug, type: String
  field :updated_at, type: Date

  searchable do
  	string :name
  	integer :doctor_especiality_id
  	integer :register_number
  end

end
