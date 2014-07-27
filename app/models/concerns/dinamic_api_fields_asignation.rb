module DinamicApiFieldsDefinination
  extend ActiveSupport::Concern

  module ClassMethods
    def define_fields(fields = [])
      fields.each do |field|
        class_eval <<-METHODS, __FILE__, __LINE__ + 1
          field :#{field}
        METHODS
      end
    end
  end
end