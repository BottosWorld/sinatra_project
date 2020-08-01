class SessionsController < ApplicationController

    get '/signup' do
        erb :'/signup'
    end

    get '/user/homepage' do
        session[:email] = params[:email]
        redirect '/user/homepage'
        # erb :'/user/homepage'
    end

end