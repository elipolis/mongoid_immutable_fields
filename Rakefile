require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "mongoid_immutable_fields"
  gem.homepage = "http://github.com/jeffbozek/mongoid_immutable_fields"
  gem.license = "MIT"
  gem.summary = %Q{A simple gem that allows for creating immutable fields on your Mongoid documents.}
  gem.description = %Q{Prevent fields from being updated by including a mongoid module and marking the fields as immutable.}
  gem.email = "jeff.bozek@gmail.com"
  gem.authors = ["Jeff Bozek"]
  gem.files = Dir.glob('lib/**/*.rb')
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency 'mongoid', '>= 3.0.0'
end
Jeweler::RubygemsDotOrgTasks.new

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
rescue LoadError
  task(:spec){abort "`gem install rspec` to run specs"}
end
task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mongoid_immutable_fields #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
