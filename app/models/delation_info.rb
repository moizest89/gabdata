class DelationInfo
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String
  field :created_at, type: Date
  field :delation_institution_id, type: Integer
  field :email, type: String
  field :kind, type: String
  field :phone, type: String
  field :updated_at, type: Date

  searchable do
    string :email
    string :phone
    string :kind
  end
end
