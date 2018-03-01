require 'simplecov'
SimpleCov.start 'rails'

require 'cucumber/rails'
require 'factory_bot_rails'

ActionController::Base.allow_rescue = false

# tell cucumber where to find additional support files
Dir['../../spec/factories/*.rb'].each {|file| require_relative file }
Dir[Rails.root.join('spec/support/matchers/*.rb')].each { |file| require file  }

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

World(FactoryBot::Syntax::Methods)