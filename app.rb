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
    if user_exists?(params['email'])
      flash[:alert_danger] = "You already have an account, you have been redirected to the log in page"
      redirect'/login'
    else
      User.sign_up(params['email'], params['password'])
      flash[:alert_success] = "You have successfully signed up"
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

  post '/logout' do
    redirect('/')
  end
  
  get '/login' do
    erb(:login)
  end

  post '/login' do
    if user_exists?(params['email'])
      if correct_password?(params['email'], params['password'])
        flash[:alert_success] = "You have successfully logged in"
        redirect('/spaces')
      else 
        flash[:alert_danger] = "Your password was incorrect, please try again"
        redirect'/login'
      end
    else
      flash[:alert_danger] = "Your details were not recognised, please try again"
      redirect'/login'
    end

  end

  run! if app_file == $0
end
