require 'sinatra'
require 'pivotal-tracker'
require 'erb'

get '/' do
  PivotalTracker::Client.token = 'd66e0691ee1d86da00c1ced58587cbc6'
  PivotalTracker::Client.use_ssl = true
  @projects = PivotalTracker::Project.all
  
  erb :index
  
end


