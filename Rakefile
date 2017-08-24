ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Open an irb session preloaded with this library"
task :console do
  sh "irb -rubygems -I lib -r ./config/environment.rb"
end