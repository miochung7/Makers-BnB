require 'sinatra/base'
require './lib/users'

class MakersBnb < Sinatra::Base

  get '/' do
    erb(:index)
  end
  
  post '/spaces' do
    User.sign_up(params['email'], params['password'])
    redirect('/spaces')
  end
  
  get '/spaces' do
    @spaces = [
      'Cottage in Cotswold',
      'Apartment in Manchester',
      'Canary Wharf Penthouse'
    ]
    erb(:spaces)
  end

  get '/spaces/new' do
    erb(:'spaces/new')    
  end

  post '/logout' do
    redirect('/')
  end

  run! if app_file == $0
end