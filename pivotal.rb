# require 'sass'
# require 'haml'
# require 'sinatra'
# require 'pivotal-tracker'

require "sinatra/config_file"

# set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

configure do
  config_file "config/settings.yml"
end

get "/css/:stylesheet.css" do
  content_type "text/css", :charset => "UTF-8"
  sass :"css/#{params[:stylesheet]}"
end


get '/' do
  PivotalTracker::Client.token = settings.token
  PivotalTracker::Client.use_ssl = true
  @projects = PivotalTracker::Project.all

  haml :index
end

get '/static' do
  haml :static
end


