require 'sinatra/base'
require './lib/users'

class MakersBnb < Sinatra::Base

  get '/' do
    erb(:index)
  end
  
  post '/spaces' do
    User.sign_up(params['email'], params['password'])
    p params
    redirect('/spaces')
  end
  
  get '/spaces' do
    @spaces = [
      'Cottage in Cotswold',
      'Apartment in Manchester',
      'Canary Wharf penthouse'
    ]
    erb(:spaces)
  end

  run! if app_file == $0
end