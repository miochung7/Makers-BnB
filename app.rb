require 'sinatra/base'


require './lib/users'
require './lib/space'
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

  # Sign up button directs to /spaces

  post '/' do
    session[:email] = params[:email]
    "logged in as #{session[:email]}"
    if user_exists?(params['email'])
      flash[:alert_danger] = "You already have an account, you have been redirected to the log in page"
      #erb(:index)
      redirect'/login'
    else
      User.sign_up(params['email'], params['password'])
      flash[:alert_success] = "You have successfully signed up"
      erb(:index)
      redirect('/spaces')
    end
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

  get '/logout' do
    @email = session.delete(:email)
    p session[:email]
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

<<<<<<< HEAD
  get '/sessions/destroy' do
=======
  post '/login' do
    if user_exists?(params['email'])
      flash[:alert_success] = "You have successfully logged in"
      #erb(:index)
      redirect('/spaces')
    else
      flash[:alert_danger] = "Your details were not recognised, please try again"
      #erb(:index)
      redirect'/login'
    end
>>>>>>> 8d398c7b4e69d02252b9441acdb2d03dbec6711a

  end

  run! if app_file == $0
end
