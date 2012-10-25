require 'spec_helper'

describe Mongoid::ImmutableFields do

  describe "#save" do

    context "on a new record" do

      let(:document) { DummyDocument.new(:name => 'Name', :description => 'Description', :reference_id => 'abc123') }

      it 'should pass' do
        document.save.should eq true
      end

      context 'when an immutable field is changed before initial persistence' do
        before { document.name = 'Test2' }

        it 'should pass' do
          document.save.should eq true
        end
      end

    end

    context "on a persisted record" do
      let(:document) { DummyDocument.create!(:name => 'Name', :description => 'Description', :reference_id => 'abc123') }

      context 'when a mutable field has changed' do
        before { document.description = 'Updated Description' }

        it 'should pass' do
          document.save.should eq true
        end
      end

      context 'when an immutable field has changed' do
        before { document.name = 'Updated Name' }

        it 'should fail' do
          document.save.should eq false
        end

        it 'should populate the errors entry' do
          document.save
          document.errors[:name].should == [ "is immutable and cannot be updated" ]
        end

      end
    end
  end
end