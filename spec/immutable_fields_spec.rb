require 'spec_helper'

describe Mongoid::ImmutableFields do
  
  describe 'when persisting a document with immutable fields' do
    
    before(:each) do
      @dummy = DummyDocument.new(:name => 'Test', :description => 'Test document.', :reference_id => 'abc123')
    end
  
    it 'should be persisted normally' do
      @dummy.save.should eq true
    end
    
    it 'should be persisted normally when immutable fields change prior to initial persistence' do
      @dummy.name = 'Test2'
      @dummy.save.should eq true
    end
    
  end
  
  describe 'when persisting a document with immutable fields and an after_create call that re-saves the document' do
    before(:each) do
      @dummy = DummyDocumentAfterCreate.new(:name => 'Test', :description => 'Test document.', :reference_id => 'abc123')
    end
  
    it 'should be persisted normally' do
      # Right now the only way for this to work is to actually execute a self.reload as the first step in an after_create.
      @dummy.save.should eq true
      @dummy.errors.should be_empty
    end
  end
  
  describe 'when updating a document with immutable fields' do
    
    before(:each) do
      @dummy = DummyDocument.create(:name => 'Test', :description => 'Test document.', :reference_id => 'abc123')
    end
    
    it 'should not allow a document to be persisted if an immutable field has changed' do
      @dummy.name = 'New Test'
      @dummy.save.should eq false
      @dummy.errors[:name].include?("is immutable and cannot be updated").should eq true
    end
    
  end

end