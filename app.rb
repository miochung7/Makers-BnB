require 'sinatra/base'
require './lib/users'
require './lib/space'
require 'sinatra/flash'
require './helpers/helpers'
require 'rack/flash'
require './lib/session'
require 'simple_calendar'
require './lib/calendar.rb'

## To display the calendar in a web browser


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
      redirect('/logged_in')

    end
  end

  get '/spaces' do
    working = Session.check(session[:id])
    if not working
      redirect '/login'
    else
    @spaces = Space.all
    erb(:spaces)
    end
  end

  get '/logged_in' do
    session[:id] = 1
    redirect '/spaces'
  end

  post '/logout' do
    redirect('/login')
  end

  get '/logout' do
    session[:id] = nil
    redirect('/login')
  end

  post '/logged_in' do
    redirect '/logged_in'
  end

  get '/test_session' do
    working = Session.check(session[:id])
    if not working
      redirect '/login'
    else
      "page is working"
    end
  end

  post '/spaces' do
    @spaces = Space.filter_dates(available_from: params[:available_from])
    erb(:spaces)
  end

  get '/spaces/:id' do
    @space = Space.find(id: params[:id])
    p params[:id]
    erb(:each_space)
  end

  get '/spaces/new' do
    # @spaces = Space.find(id: params[:id])
    erb(:'spaces/new')
  end

  post '/new_space' do
    Space.create_space(name: params[:name], description: params[:description], price_per_night: params[:price_per_night], available_from: params[:available_from], available_to: params[:available_to])
    redirect('/spaces')
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
