class UserController < ApplicationController
    use Rack::Flash

    get '/user' do
        @user = User.new
        erb :'/signup'
    end

    # get '/login' do
    #     @user = User.new
    #     erb :login
    # end

    # post '/user/homepage' do
    #     "You are logged in as #{session[:user_id]}"
    # end

    post "/user" do
    
        @user = User.new(params[:user])
        if @user.save
          session[:user_id] = @user.id
          redirect '/user/homepage'
        else
          redirect '/user/place_wager'
        end
        
    end

    get '/user/user_stats' do
        erb :'/user/user_stats'
    end

    get '/user/live_bets' do
        erb :'/user/live_bets'
    end

    get '/user/homepage' do
        erb :'/user/homepage'
    end

    
end