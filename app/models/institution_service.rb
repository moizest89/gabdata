class InstitutionService
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :active, type: String
  field :address, type: String
  field :created_at, type: Date
  field :description, type: String
  field :general_requirements, type: String
  field :institution_id, type: String
  field :institution_service_category_id, type: String
  field :name, type: String
  field :observations, type: String
  field :request_address, type: String
  field :response_times, type: String
  field :responsible, type: String
  field :updated_at, type: Date
end
