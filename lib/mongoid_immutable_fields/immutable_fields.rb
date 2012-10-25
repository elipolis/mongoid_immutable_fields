module Mongoid

  module ImmutableFields
    extend ActiveSupport::Concern

    included do
      validate :check_immutability, :unless => :new_record?
      class_attribute :immutable_field_names
    end

    module ClassMethods
      def immutable_fields(*fields)
        self.immutable_field_names = fields.map(&:to_s)
      end
    end

  private
    def check_immutability
      changed.each do |field|
        if self.immutable_field_names.include?(field)
          self.errors.add( field, 'is immutable and cannot be updated' )
        end
      end
    end
  end
end