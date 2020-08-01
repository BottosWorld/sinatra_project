class WagerController < ApplicationController

    get '/user/place_wager' do
        if !logged_in?
            redirect '/welcome'
        else
            erb :place_wager
        end
    end

end