
require 'sinatra'
require 'csv'
require 'gossip'

get '/' do
  erb :index, locals: { gossips: Gossip.all }
end

get '/gossips/new/' do
  erb :new_gossip
end

post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
end

get '/gossips/:id' do
  gossip = Gossip.find(params['id'].to_i)
  erb :show, locals: { gossip: gossip }
end

post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save
  redirect '/'
end

