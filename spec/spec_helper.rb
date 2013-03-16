require 'mongoid'
require 'database_cleaner'
require 'mongoid_immutable_fields'
require 'rubygems'

Dir["./spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|

  DatabaseCleaner.strategy = :truncation

  Mongoid.connect_to("monogid_immutable_fields_test")

  config.before(:each) do
    DatabaseCleaner.clean
  end

  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  config.mock_with :rspec

end