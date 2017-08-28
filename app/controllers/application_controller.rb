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
    if valid_input?(params)
      @musician = Musician.new(username: params[:username], name: params[:name], password: params[:password], type_of_musician: params[:type], net_worth: params[:net_worth])
      session[:user_id] = @musician.id
      @musician.save
      redirect to "/musicians/#{@musician.id}"
    else
      redirect to '/'
    end
  end

  get '/musicians/:id' do
    erb :'/musicians/show_musician'
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
