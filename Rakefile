require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :create do
  puts "Creating development and test databases if they don't exist..."
  system("createdb #{APP_NAME}_development && createdb #{APP_NAME}_test")
end

task :console do
	Pry.start
end