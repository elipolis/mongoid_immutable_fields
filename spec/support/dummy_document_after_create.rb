class DummyDocumentAfterCreate
  include Mongoid::Document
  include Mongoid::ImmutableFields
  
  field :name
  field :description
  field :reference_id
  
  immutable_fields :name, :reference_id
  
  after_create :change_field_and_save_again

  def change_field_and_save_again
    self.reload
    self.description = 'New desc'
    self.safely.save
  end

end