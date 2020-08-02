class WagerController < ApplicationController
    use Rack::Flash

    get '/user/place_wager' do
        if logged_in?
            redirect '/'
        else
            erb :'/user/place_wager'
        end
    end

    post '/user/homepage' do
        erb :'/user/homepage'
    end

    post '/user/live_bets' do
        erb :'/user/live_bets'
    end

end