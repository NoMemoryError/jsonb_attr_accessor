# frozen_string_literal: true

require 'bundler/setup'
require 'jsonb_attr_accessor'
require 'yaml'
require 'pry'
require 'awesome_print'
require 'rspec'
require 'database_cleaner'

class System < ActiveRecord::Base
  jsonb_attr_accessor :settings, :system_url, :username, :password
end

RSpec::Matchers.define :attr_accessorize do |attribute_name|
  match do |actual|
    actual.respond_to?(attribute_name) && actual.respond_to?("#{attribute_name}=")
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before :suite do
    dbconfig = YAML.load(File.open('db/config.yml'))
    ActiveRecord::Base.establish_connection(dbconfig['test'])
  end

  config.before do
    DatabaseCleaner.clean_with(:truncation)
  end
end
