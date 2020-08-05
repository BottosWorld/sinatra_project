require './config/environment'
require 'rack-flash'
require 'dotenv'
require 'securerandom'
Dotenv.load


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET'] {SecureRandom.hex(64)}
  end

  get "/" do
    erb :welcome
  end

  helpers do 
    def current_user
      @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end
  end

end
