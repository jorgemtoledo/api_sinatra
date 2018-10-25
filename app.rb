require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'mongoid'

Mongoid.load! 'mongoid.config'

class Atweet
  include Mongoid::Document
  include Mongoid::Timestamps

  field :author, type: String, default: 'ANON'
  field :content, type: String
  field :image, type: String
  field :tags, type: Array, default: []
  field :likes, type: Integer, default: 0
end


# Actions get
# get '/api/v1/tweets' do
#   'Lists OK'
# end
# get ('/api/v1/tweets') { 'Lists OK'}
get ('/api/v1/tweets') { Atweet.all.to_json }

# Actions post
post '/api/v1/tweets' do
  # puts "-------------------------teste"

  # puts "-------------------------teste #{request.body.read}"

  # new_atweet = Atweet.new(request.body.read)
  headers('Content-Type' => :json)
  new_atweet = Atweet.new(JSON.parse(request.body.read)).save
  new_atweet.to_json

end