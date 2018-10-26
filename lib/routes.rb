require 'sinatra/namespace'

namespace '/api/v1' do
  # Actions get
  # get '/api/v1/tweets' do
  #   'Lists OK'
  # end
  # get ('/api/v1/tweets') { 'Lists OK'}
  get ('/tweets') { Atweet.all.to_json }

  # Actions post
  post '/tweets' do
    # puts "-------------------------teste"

    # puts "-------------------------teste #{request.body.read}"

    # new_atweet = Atweet.new(request.body.read)
    headers('Content-Type' => :json)
    new_atweet = Atweet.new(JSON.parse(request.body.read)).save
    new_atweet.to_json
  end

end