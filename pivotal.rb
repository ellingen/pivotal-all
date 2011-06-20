require 'sass'
require 'haml'
require 'sinatra'
require 'pivotal-tracker'

# set utf-8 for outgoing
before do
  headers "Content-Type" => "text/html; charset=utf-8"
end

get "/css/:stylesheet.css" do
  content_type "text/css", :charset => "UTF-8"
  sass :"css/#{params[:stylesheet]}"
end


get '/' do
  PivotalTracker::Client.token = ''
  PivotalTracker::Client.use_ssl = true
  @projects = PivotalTracker::Project.all
  haml :index
end

get '/static' do
  haml :static
end


