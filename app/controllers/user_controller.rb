class UserController < ApplicationController

    get '/login' do
        erb :login
    end

    post '/user/homepage' do
        "You are logged in as #{session[:email]}"
    end

end