source 'https://rubygems.org'

gem 'activerecord', require: 'active_record'
gem 'bcrypt'
gem 'bundler'
gem 'carrierwave', '~> 1.0'
gem 'json'
gem 'pry'
gem 'rack-flash3'
gem 'railroady'
gem 'rails-erd'
gem 'rake'
gem 'require_all' #=> Helps to load dependencies
gem 'rest-client'

gem 'rubygems-update'
gem 'shotgun'
gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-activerecord', require: 'sinatra/activerecord'
gem 'sinatra-flash'
gem 'thin'
gem 'tux'

group :production do
  # Use Postgresql for ActiveRecord
  gem 'pg'
end

group :development, :test do
  # Use SQLite for ActiveRecord
  gem 'sqlite3'
end