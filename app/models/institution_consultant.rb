class InstitutionConsultant
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :active, type: String
  field :created_at, type: Date
  field :description, type: String
  field :email, type: String
  field :functions, type: String
  field :institution_id, type: String
  field :job, type: String
  field :name, type: String
  field :phone, type: String
  field :updated_at, type: Date
end
