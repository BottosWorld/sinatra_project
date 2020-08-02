class SessionsController < ApplicationController
    use Rack::Flash

    get '/login' do
        @user = User.new
        erb :login
    end

    # get '/signup' do
    #     @user = User.new
    #     erb :signup
    # end

    post '/login' do
        @user = User.find_by_email(params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          flash[:notice] = "Log in successful"
          redirect '/user/homepage'
        else
          flash.now[:error] = "Username and Password do not match"
          erb :login
        end
      end

    # get '/user/homepage' do
    #     session[:email] = params[:email]
    #     erb :'/user/homepage'
    # end

end