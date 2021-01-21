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
      erb(:index)
      redirect'/login'
    else
      User.sign_up(params['email'], params['password'])
      flash[:alert_success] = "You have successfully signed up"
      #erb(:index)
      redirect('/spaces')
    end
  end

  get '/spaces' do
    @spaces = Space.all
    erb(:spaces)
  end

=begin this is new below
  post '/spaces' do
    @spaces = Space.filter_dates(available_from: params[:available_from])
    erb(:spaces)
  end
=end

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

  get '/logout' do
    #@email = session.delete(:email)
    session[:user_id] = 1
    p session[:email]
    redirect '/'
  end

  get '/login' do
    erb(:login)
  end

  #post '/sessions/destroy' do
    #session.clear
    #flash[:notice] = 'You have signed out.'
  #  redirect('/')
  #end

  #get '/sessions/new' do
  #  erb :"sessions/new"
  #end

  post '/login' do
    #if user_exists?(params['email'])
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = 1
      redirect('/spaces')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/login')
    end
  end
=begin
    result = DatabaseConnection.query("SELECT * FROM users WHERE email_address = '#{params[:email]}'")
    user = User.new(result[0]['id'], result[0]['email'], result[0]['password'])
    @user = User.find(id: params[:user_id])

    if user
      session[:user_id] = user.id
      flash[:alert_success] = "You have successfully logged in"
      redirect('/spaces')
    else
      flash[:alert_danger] = 'Please check your email or password.'
      redirect('/login')
    end
  end
=end
  run! if app_file == $0
end
