source 'https://rubygems.org'

gem 'rails', '5.0.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'sdoc', '>= 0.4.0', group: :doc
gem 'bcrypt', '>= 3.1.7'
gem 'pg'
gem 'bootstrap-sass'
gem 'bootstrap-select-rails'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-datatables-rails', '~> 3.4.0'
gem 'dotenv-rails'
gem 'roadie'
gem 'sidekiq'
gem 'sidekiq-scheduler'
gem 'redis-rails'
gem 'whenever', :require => false
gem 'kaminari'
gem 'rails_12factor', group: :production

# Use Unicorn as the app server
gem 'unicorn'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'figaro'
gem 'puma'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'shoulda-matchers'
  gem 'faker'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'webmock'
end

group :test do
  gem 'simplecov', :require => false
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '>= 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'capistrano'
  gem 'capistrano3-puma'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rvm'
end

source 'https://rails-assets.org' do
  gem 'rails-assets-tether', '>= 1.1.0'
end
