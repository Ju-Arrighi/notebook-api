source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.5"

# Use sqlite3 as the database for Active Record
gem "sqlite3", "~> 1.4"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem "rack-cors"

# ActiveModelSerializers brings convention over configuration to your JSON generation.
gem 'active_model_serializers', '~> 0.10.0'

# A ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
gem 'jwt'

# Simple, multi-client and secure token-based authentication for Rails.
gem 'devise_token_auth'

# A plugin for versioning Rails based RESTful APIs.
gem 'versionist', '~> 1.5.0'

# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks and ORMs
gem 'kaminari'

# Paginate in your headers, not in your response body.
# gem 'api-pagination'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  # Faker helps you generate realistic test data, and populate your database
  gem 'faker'
  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities
  gem 'pry', '~> 0.14.2'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
