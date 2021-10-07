# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'rubocop', require: false
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
gem 'bootsnap', require: false
gem 'bootstrap_form'
gem 'devise'
gem 'jquery-turbolinks'
gem 'materialize-sass'

gem 'simple_form'

gem 'carrierwave'

gem 'elasticsearch', '~> 7.13.3'
gem 'searchkick'

gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
gem 'figaro'
gem 'fog'
gem 'haml'
gem 'jquery-rails'
gem 'mini_magick'
gem 'omniauth-google-oauth2'
gem 'omniauth-rails_csrf_protection'
gem 'rails_admin'
gem 'rails_admin_impersonate'
gem 'redis'

gem 'whenever', require: false

gem 'rails_12factor', group: :production

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'spring'
  gem 'web-console', '>= 4.1.0'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
