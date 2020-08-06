class SessionsController < ApplicationController
    use Rack::Flash

    get '/login' do
        # @user = User.new
        erb :login
    end

    # post '/login' do
    #     # raise params[:email].inspect
    #     session[:email] = params[:email]
    #     redirect '/user/homepage'
    # end

    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          flash[:notice] = "Log in successful"
            # binding.pry here shows that user has all params assigned but none transfer to homepage
          redirect '/user/homepage'
        else
          flash.now[:error] = "Username and Password do not match"
          erb :login
        end
      end

    get '/sessions/logout' do
        session.clear
        redirect '/'
    end


    # get '/user/homepage' do
    #     session[:email] = params[:email]
    #     erb :'/user/homepage'
    # end

end