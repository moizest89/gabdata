class Institution
  include Mongoid::Document

  field :_id, type: String, default: ->{ name.to_s.parameterize }
  field :accepts_online_information_requests, type: String
  field :acronym, type: String
  field :at_complaints, type: String
  field :at_information_requests, type: String
  field :created_at, type: Date
  field :facebook_url, type: String
  field :header_content_type, type: String
  field :header_file_name, type: String
  field :header_file_size, type: String
  field :header_updated_at, type: String
  field :highlight_events, type: String
  field :information_request_correlative, type: String
  field :information_standard_category_id, type: String
  field :institution_type_id, type: String
  field :logo_content_type, type: String
  field :logo_file_name, type: String
  field :logo_file_size, type: String
  field :logo_updated_at, type: String
  field :name, type: String
  field :ranked, type: String
  field :slug, type: String
  field :transparency_external_portal_url, type: String
  field :twitter_url, type: String
  field :updated_at, type: Date
  field :website_url, type: String
end
