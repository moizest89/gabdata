class InstitutionEventParticipant
  include Mongoid::Document

  field :_id, type: String
  field :created_at, type: Date
  field :institution_event_id, type: String
  field :updated_at, type: Date
  field :user_id, type: String
end
