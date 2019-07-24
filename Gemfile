source 'https://rubygems.org'

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'actioncable', '~> 5.0.1'
gem 'redis', '~> 3.3.5'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

########## SERIALIZER
gem 'active_model_serializers'

########## AWS e Paperclip
gem 'aws-sdk', '~> 3'
gem 'aws-sdk-s3'
gem 'paperclip'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem "devise", git: "https://github.com/plataformatec/devise.git"
gem "devise-i18n"
gem 'omniauth-facebook', git: 'git://github.com/mkdynamic/omniauth-facebook.git'
gem 'devise_mailchimp', git: 'https://github.com/rentziass/devise_mailchimp.git'
gem "devise_token_auth", git: "https://github.com/lynndylanhurley/devise_token_auth.git"

########## SIDEKIQ
gem "sidekiq"
gem "sidekiq-failures"
gem 'sinatra', require: false, github: "sinatra"
gem "slim"

### COCOON
gem "cocoon"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  ### CAPISTRANO DEPLOY
  gem "capistrano"
  gem "capistrano-rails"
  gem "capistrano-passenger"
  gem "capistrano-bundler"
  gem "capistrano-db-tasks", require: false
  gem "capistrano-rvm"
  gem "highline"
  ### END CAPISTRANO

  gem "guard"
  gem "guard-rubocop"
  gem "guard-rspec", git: "https://github.com/rentziass/guard-rspec.git"
  gem "guard-livereload", "~> 2.5", require: false
  gem "rack-livereload"

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'pry'
  gem 'pry-rails'
end

gem "geocoder"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'searchkick'

# Custom Macchie
gem "slim-rails"
gem "bourbon"
gem "bower-rails"
gem "font-awesome-rails"
gem "paloma"

gem 'rack-cors', require: 'rack/cors'

##### Porcata vecchia per la ricerca
gem 'textacular'

# Debug
gem 'ruby-debug-ide'
gem 'debase'

# Notifiche push
gem 'one_signal'

group :production do
  ##### NewRelic
  gem 'newrelic_rpm'
end

