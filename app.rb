require 'sinatra/base'

class MakersBnb < Sinatra::Base

  get '/' do
    erb(:index)
  end
  
  post '/spaces' do
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