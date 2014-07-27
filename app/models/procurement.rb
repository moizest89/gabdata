class Procurement
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :amount, type: String
  field :attachment_content_type, type: String
  field :attachment_file_name, type: String
  field :attachment_file_size, type: String
  field :attachment_updated_at, type: String
  field :compliance_deadlines, type: String
  field :counterpart_info, type: String
  field :created_at, type: Date
  field :form_of_contract, type: String
  field :institution_id, type: String
  field :name, type: String
  field :updated_at, type: Date
  
  searchable do
    string :amount
    string :attachment_file_name
    string :compliance_deadlines
    string :name
  end

end
