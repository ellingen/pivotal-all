require 'rubygems'
require 'bundler'

Bundler.require
require './pivotal.rb'

run Sinatra::Application

