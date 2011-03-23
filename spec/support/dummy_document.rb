class DummyDocument
  include Mongoid::Document
  include Mongoid::ImmutableFields
  
  field :name
  field :description
  field :reference_id
  
  immutable_fields :name, :reference_id
  
end