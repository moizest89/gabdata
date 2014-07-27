class InstitutionEvent
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :active, type: String
  field :attend, type: String
  field :contact_charge, type: String
  field :contact_email, type: String
  field :contact_name, type: String
  field :contact_phone, type: String
  field :created_at, type: Date
  field :description, type: String
  field :end_at, type: String
  field :institution_id, type: String
  field :name, type: String
  field :notes, type: String
  field :place, type: String
  field :start_at, type: String
  field :updated_at, type: Date
end
