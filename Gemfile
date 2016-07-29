source 'https://rubygems.org'

gem 'rails'
gem 'sass-rails'
gem 'bootstrap-sass'
gem 'uglifier'
gem 'coffee-rails'
gem 'slim-rails'
gem 'angular-rails-templates'

gem 'puma'
gem 'redis'
gem 'bcrypt'
gem 'pg'
gem 'oj'
gem 'multi_json'
gem 'figaro'
gem 'rack-cors', :require => 'rack/cors'
gem 'rest-client'
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'ransack',             github: 'activerecord-hackery/ransack'
gem 'draper',              '> 3.x'
gem 'pg_search'
gem 'rails_12factor', group: :production

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'annotate'
  gem 'bullet'
  gem 'pry-rails'
  gem 'did_you_mean'
end

group :development do
  gem "airbrussh", require: false
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
end

group :test do
  gem 'api_matchers'
  gem 'simplecov', require:  false
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'faker'
  gem 'factory_girl_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
