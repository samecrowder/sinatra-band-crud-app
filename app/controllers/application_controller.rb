class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
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
    
  end
end
