# Mongoid Immutable Fields

## Description

A simple gem that enforces immutability on selected fields.

## Installation

Include the gem in your Gemfile

    gem 'mongoid_immutable_fields'
    
## Usage

Add this to your document

    include Mongoid::ImmutableFields

then declare your immutable fields like so 

    immutable_fields :name, :reference_id

your document will look something like

    class DummyDocument
      include Mongoid::Document
      include Mongoid::ImmutableFields

      field :name
      field :description
      field :reference_id

      immutable_fields :name, :reference_id

    end

Now documents will not update if one of the immutable fields has changed value since initial persistence/creation. If a field is changed and attempted to be saved/updated the following error will be added to the document for the changed immutable field
    
    is immutable and cannot be updated

## Contributing to mongoid_immutable_fields
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Jeff Bozek. See LICENSE.txt for
further details.

