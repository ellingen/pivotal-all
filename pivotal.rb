# require 'sass'
# require 'haml'
# require 'sinatra'
# require 'pivotal-tracker'

require "sinatra/config_file"

# set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8"
  PivotalTracker::Client.token = settings.token
  PivotalTracker::Client.use_ssl = true
end

configure do
  config_file "config/settings.yml"
end

get "/css/:stylesheet.css" do
  content_type "text/css", :charset => "UTF-8"
  sass :"css/#{params[:stylesheet]}"
end

get '/' do
  @projects = PivotalTracker::Project.all

  haml :index
end

get '/update/:status' do
  @projects = PivotalTracker::Project.all
  @status = params[:status]
  
  haml :update, :layout => false
end

get '/static' do
  haml :static
end


