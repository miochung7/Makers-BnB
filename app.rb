require 'sinatra/base'
require './lib/space'
require './lib/database_connection'
require './lib/database_connection_setup'

class MakersBnb < Sinatra::Base
  
  enable :sessions, :method_override

  get '/' do
    erb(:index)
  end

  # Sign up button directs to /spaces
  post '/' do
    redirect('/spaces')
  end
   
  get '/spaces' do
    # @spaces = [
    #   'Cottage in Cotswold',
    #   'Apartment in Manchester',
    #   'Canary Wharf Penthouse'
    # ]
    @spaces = Space.all
    erb(:spaces)
  end

  get '/spaces/new' do
    erb(:'spaces/new')    
  end

  post '/spaces' do
    Space.create_space(name: params[:name], description: params[:description], price_per_night: params[:price_per_night], available_from: params[:available_from], available_to: params[:available_to])
    redirect('/spaces')
  end

  post '/logout' do
    redirect('/')
  end

  run! if app_file == $0
end