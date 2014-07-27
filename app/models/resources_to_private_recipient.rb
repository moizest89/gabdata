class ResourcesToPrivateRecipient
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :allocation_of_resources, type: String
  field :attachment_content_type, type: String
  field :attachment_file_name, type: String
  field :attachment_file_size, type: String
  field :attachment_updated_at, type: String
  field :created_at, type: Date
  field :institution_id, type: String
  field :name, type: String
  field :resources_amount, type: String
  field :updated_at, type: Date
  
  searchable do
    string :name
    string :resources_amount
    string :attachment_file_name
  end
  
end
