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
    set :session_secret, ENV['SINATRA_SECRET'] {SecureRandom.hex(64)}
  end

  get "/" do
    mlb_schedule
    erb :welcome
  end

  helpers do 
    def current_user
      @user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def mlb_schedule
      @sportsdata = DailySchedule::API.new
    end

    # def game_one
    #   mlb_schedule
    #   @sportsdata.daily_baseball.map |awayteam| do
        
    #   end
    # end
  end


end
