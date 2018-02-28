source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'
gem 'rails', '~> 5.1.5'
gem 'sqlite3'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.4', '>= 4.4.1'
gem 'dotenv-rails', '~> 2.2', '>= 2.2.1'


group :development, :test do
  gem 'rspec-rails', '~> 3.7', '>= 3.7.2'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'simplecov', require: false
  gem 'capybara', '~> 2.12.0'
  gem 'capybara-webkit', '~> 1.14'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.2'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'faker', '~> 1.8', '>= 1.8.7'
  gem 'shoulda-matchers', require: false
  gem 'guard', '~> 2.14', '>= 2.14.2'
  gem 'guard-rspec', require: false
  gem 'guard-cucumber', '~> 2.1', '>= 2.1.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
