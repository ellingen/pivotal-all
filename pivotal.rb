require 'sinatra'
require 'pivotal-tracker'
require 'erb'

get '/' do
  PivotalTracker::Client.token = ''
  PivotalTracker::Client.use_ssl = true
  @projects = PivotalTracker::Project.all
  
  erb :index
  
end


