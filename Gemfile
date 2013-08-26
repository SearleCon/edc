source 'https://rubygems.org'

ruby '2.0.0'


# Rails
gem "rails", "~> 4.0.0"
gem 'jbuilder', '~> 1.0.1'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '~> 1.3.0'


# Frontend
gem 'haml-rails'
gem 'bootstrap-sass', '~> 2.3.2.1'
gem 'normalize-rails'
gem 'bootswatch-rails'


# Authentication
gem 'devise', "~> 3.0.0"
gem "devise-async"

# Authorization
gem "cancan", "~> 1.6.10"
gem "rolify", "~> 3.3.0.rc4"


# Form Builders
gem 'simple_form', "3.0.0.rc"
gem 'country_select'



# Env variables
gem "figaro"

# Multi tenancy
gem "acts_as_tenant", "~> 0.3.1"


# Background Processing
gem "delayed_job", "~> 4.0.0"
gem "delayed_job_active_record", "~> 4.0.0"

# Pagination
gem 'will_paginate', '~> 3.0'


# Notifications
gem "gritter", "1.0.3"

# DropBox
gem "dropbox-api"



# Turbolinks
gem 'jquery-turbolinks'
gem 'turbolinks', '~> 1.3.0'


# App Responders - Sets flash in respond_with()
gem 'responders', '1.0.0.rc'



group :development do
  gem "better_errors"
  gem 'annotate', '~> 2.5.0'
  gem 'sqlite3'
  gem 'jazz_hands'
  gem 'quiet_assets'
end



group :production do
  gem 'pg'
end

group :test do
  # Test suites
  gem 'rspec-rails', '~> 2.0'
  gem "capybara", "~> 2.0.2"
  gem "launchy", "~> 2.2.0"


  # Factories
  gem "faker", "~> 1.1.2"
  gem "factory_girl_rails", "~> 4.2.1"
  gem "database_cleaner", '1.0.0.RC1'


  # Matchers
  gem "shoulda-matchers"
  gem 'json_spec'
  gem 'email_spec'
end
