source 'https://rubygems.org'

ruby '2.1.3'

gem 'rails', '4.1.6'

gem 'coffee-rails'
gem 'devise'
gem 'exception_notification'
gem 'font-awesome-rails'
gem 'haml-rails'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'mail_form', github: 'plataformatec/mail_form'
gem 'mandrill-api'
gem 'kaminari'
gem 'pg'
gem 'prawn'
gem 'sass-rails'
gem 'rails_admin'
gem 'uglifier', '>= 1.3.0'
gem 'unicorn'


group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'foreman'
  gem 'mailcatcher'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '>= 2.14'
  gem 'faker'
end

group :test do
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'capybara-email'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.6.7'
  gem 'rails_12factor'
end

