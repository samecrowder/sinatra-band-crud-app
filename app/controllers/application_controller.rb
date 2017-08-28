class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    #binding.pry
    erb :'/index'
  end

  get '/signup' do
    if session[:user_id] == nil
      erb :'/musicians/create_musician'
    end
  end

  post '/signup' do
    #binding.pry
    if valid_input?(params)
      @musician = Musician.new(username: params[:username], name: params[:name], password: params[:password], type_of_musician: params[:type], net_worth: params[:net_worth])
      session[:user_id] = @musician.id
      @musician.save
      redirect to "/musicians/#{@musician.id}"
    else
      redirect to '/'
    end
  end

  get '/login' do
    if session[:user_id] == nil
      erb :'/musicians/login'
    end
  end

  post '/login' do
    @musician = Musician.find_by(username: params[:username])
    if @musician && @musician.authenticate(params[:password])
      session[:user_id] = @musician.id
      redirect to "/musicians/#{@musician.id}"
    else
      redirect to '/login'
    end
  end

  get '/musicians/:id' do
    erb :'/musicians/show_musician'
  end

  get '/musicians' do
    erb :'/musicians/musicians'
  end

  def valid_input?(params)
    if Musician.find_by(username: params[:username])
      #This username is already taken
      false
    else
      true
    end
  end
end
