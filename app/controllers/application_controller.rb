class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get '/' do
    erb :'/index'
  end

  get '/signup' do
    if session[:user_id] == nil
      erb :'/musicians/create_musician'
    end
  end

  post '/signup' do
    if valid_input?(params)
    end
  end

  def valid_input?(params)
    {"name"=>"", "username"=>"", "password"=>"", "type"=>"", "net_worth"=>""}
    if Musician.find_by(username: params[:username])
      #error that this username is taken
      redirect to "/"
    end
  end
end
