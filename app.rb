require 'sinatra/base'
require './lib/users'
require 'sinatra/flash'
require './helpers/helpers'
require 'rack/flash'



class MakersBnb < Sinatra::Base
  enable :sessions
  set :session_secret, "something"

  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  post '/' do
    if user_exists?(params['email'])
      flash[:alert_danger] = "You already have an account, you have been redirected to the log in page"
      redirect'/login'
    else
      User.sign_up(params['email'], params['password'])
      redirect('/spaces')
    end
  end

  post '/spaces' do

  end
  
  get '/spaces' do
    erb(:spaces)
  end

  get '/spaces/new' do
    erb(:'spaces/new')    
  end

  post '/logout' do
    redirect('/')
  end
  
  get '/login' do
    erb(:login)
  end

  run! if app_file == $0
end
