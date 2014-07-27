class InstitutionServiceStep
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :cost, type: String
  field :created_at, type: Date
  field :description, type: String
  field :documents, type: String
  field :duration, type: String
  field :institution_service_id, type: String
  field :name, type: String
  field :observations, type: String
  field :priority, type: String
  field :requirements, type: String
  field :response_time, type: String
  field :responsible, type: String
  field :schedule, type: String
  field :updated_at, type: Date
end
