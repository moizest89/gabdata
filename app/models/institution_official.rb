class InstitutionOfficial
  include Mongoid::Document

  field :_id, type: String
  field :active, type: String
  field :created_at, type: Date
  field :curriculum, type: String
  field :description, type: String
  field :email, type: String
  field :institution_id, type: String
  field :job, type: String
  field :name, type: String
  field :phone, type: String
  field :picture_content_type, type: String
  field :picture_file_name, type: String
  field :picture_file_size, type: String
  field :picture_updated_at, type: String
  field :updated_at, type: Date
end
