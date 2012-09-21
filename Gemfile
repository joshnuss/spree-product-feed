source 'http://rubygems.org'

gem 'sqlite3'

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'libnotify'
end

group :test do
  gem 'autotest'
  gem 'rspec-rails', '~> 2.11.0'
  gem 'factory_girl'
  gem 'faker'
end

group :cucumber do
  gem 'cucumber-rails', '1.0.0'
  gem 'database_cleaner', '~> 0.8.0'
  gem 'nokogiri'
  gem 'capybara', '1.0.1'
end

if RUBY_VERSION < "1.9"
  gem "ruby-debug"
else
  gem "ruby-debug19"
end

gemspec
