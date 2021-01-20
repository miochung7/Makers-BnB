require 'sinatra/base'
require './lib/users'
require 'sinatra/flash'
require './helpers/helpers'
require 'rack/flash'



class MakersBnb < Sinatra::Base
  enable :sessions
  set :session_secret, "something"

  register Sinatra::Flash
  #use Rack::Flash, :sweep => true

  get '/' do
    #flash.now[:notice] = "Hooray, Flash is working!"
    erb(:index)
  end

  post '/' do
    if user_exists?(params['email'])
      #flash[:error] = "Invalid message"
      flash[:alert_danger] = "You already have an account, you have been redirected to the log in page"
      erb(:index)
      redirect'/login'
    else
      User.sign_up(params['email'], params['password'])
      #flash[:success] = "Message saved successfully."
      redirect('/spaces')
    end
    #redirect('/')
  end

  post '/spaces' do

  end
  
  get '/spaces' do
    @spaces = [
      'Cottage in Cotswold',
      'Apartment in Manchester',
      'Canary Wharf penthouse'
    ]
    erb(:spaces)
  end

  get '/login' do
    erb(:login)
  end

  run! if app_file == $0
end
