# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.8'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem 'cssbundling-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  # gem 'debug', platforms: %i[mri mingw x64_mingw]

  # Adds step-by-step debugging and stack navigation capabilities to pry using byebug.
  gem 'debug'
  # gem 'pry-byebug', '~> 3.10.1'
  # gem 'pry-doc', '~> 1.5.0'
  # gem 'pry-theme', '~> 1.3.1'

  # Shim to load environment variables from .env into ENV in development.
  gem 'dotenv', '~> 2.8.1', require: 'dotenv/load'

  # Rails testing library
  gem 'rspec-rails', '~> 6.1.0'

  # Fixtures replacement with a straightforward definition syntax
  gem 'factory_bot_rails', '~> 6.4.3'

  # Library for generating fake data such as names, addresses, and phone numbers.
  gem 'faker', '~> 3.2.3'

  # A gem providing "time travel" and "time freezing" capabilities,
  gem 'timecop', '~> 0.9.8'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
  gem 'letter_opener', '~> 1.8.1'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'

  gem 'database_cleaner', '~> 2.0.2'

  gem 'selenium-webdriver'

  # RSpec for testing sidekiq worker and jobs
  gem 'rspec-sidekiq', '~> 4.1.0'

  # RSpec libraries
  gem 'shoulda-callback-matchers', '~> 1.1.4'
  gem 'shoulda-matchers', '~> 5.3.0'

  gem 'rails-controller-testing', '~> 1.0.5'
end

# Ruby static code analyzer (a.k.a. linter) and code formatter.
gem 'rubocop', '~> 1.60', require: false

# Rails forms made easy.
gem 'simple_form', '~> 5.1.0'

# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise', '~> 4.8.1'

# Simple, efficient background processing for Ruby.
gem 'sidekiq', '~> 7.2.1'

# An email validator for Rails 3+.
gem 'email_validator', '~> 2.2.4'
