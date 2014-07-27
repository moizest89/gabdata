class Lawyer
  include Mongoid::Document
  include Sunspot::Mongoid2

  field :_id, type: String
  field :name, type: String
  field :lastname, type: String
  
  searchable do
    string :name
    string :lastname
  end
  
end
