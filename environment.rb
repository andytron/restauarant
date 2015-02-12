require 'rubygems'
require 'bundler'
require 'active_record'

if ENV['APP_ENV'] == 'production'
  require 'sinatra/reloader'
  Bundler.require(:default, :production)
  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "restaurants",
    host: "localhost"
  )
else
  Bundler.require(:default)
  ActiveRecord::Base.establish_connection(
    adapter: "postgresql",
    database: "restaurants",
    host: "localhost"
  )
end

['models/concerns', 'models', 'helpers', 'controllers'].each do |component|
  Dir["#{component}/*.rb"].sort.each do |file|
    require File.expand_path(file)
  end
end