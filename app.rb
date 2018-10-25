require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'sinatra/namespace'

get '/api/v1/tweets' do
  'Lists OK'
end