module Mongoid

  module ImmutableFields
    extend ActiveSupport::Concern
    
    included do
      validate :check_immutability, :on => :update
      class_attribute :immutable_field_names
      delegate :immutable_field_names, :to => "self.class"
    end
    
    module ClassMethods
      def immutable_fields(*field_names)
        self.immutable_field_names = field_names
      end
    end
    
  private
    def check_immutability
      changed_as_symbols.each do |field|
        if immutable_field_names.include? field
          errors.add( field, 'is immutable and cannot be updated' )
          self.reset_attribute! field.to_s
        end
      end
    end
  end
end