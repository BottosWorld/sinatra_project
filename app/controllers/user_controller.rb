class UserController < ApplicationController
    use Rack::Flash

    get '/signup' do
        # @user = User.new
        erb :'/signup'
    end

    # get '/user/homepage' do
    #     # binding.pry
    #     # raise session[:email].inspect
    #     "You are logged in as #{session[:email]}"
    # end

    post "/signup" do
        @user = User.new(email: params["email"], password: params["password"])
        @user.save
        session[:user_id] = @user.id
        # binding.pry shows that user and all params are nil, why is this happening?
        redirect '/user/homepage'
        # else
        #   redirect '/user/place_wager'
        # end
        
    end

    get '/user/user_stats' do
        erb :'/user/user_stats'
    end

    get '/user/live_bets' do
        erb :'/user/live_bets'
    end

    get '/user/homepage' do
        current_user
        erb :'/user/homepage'
    end

    
end