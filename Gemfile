source 'https://rubygems.org'

ruby '3.2.3'

gem 'rails', '~> 7.1.3'
gem 'sprockets-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'jbuilder'
gem 'redis', '>= 4.0.1'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem 'kredis'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

gem 'sassc-rails'
gem 'rest-client'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'bootsnap', require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'rspec-rails'
  gem 'should_not'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
end
gem 'rswag'

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :test do
  gem 'simplecov', require: false
end

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

gem 'faker'
gem 'devise'
gem 'draper'
gem 'sort_n_params', path: 'vendor/sort_n_params'
gem 'will_paginate'
gem 'will_paginate-bootstrap-style'
gem 'cocoon'
gem 'cancancan'

# To run async and crons
gem 'matrix' # Needed to work with sidekiq
gem 'sidekiq', '~> 7.1.6'
gem 'sidekiq-cron'
gem 'sidekiq-failures'

# Jwt
gem 'jwt'
gem 'geocoder'
gem "aws-sdk-s3", require: false
gem "aws-sdk-cloudfront"
