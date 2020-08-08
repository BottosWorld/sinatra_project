class WagerController < ApplicationController
    use Rack::Flash

    get '/user/place_wager' do
        if !logged_in?
            redirect '/'
        else
            @wager = Wager.new
            erb :'/user/place_wager'
        end
    end

    post '/user/homepage' do
        erb :'/user/homepage'
    end

    get '/all_bets' do
        @wager = Wager.all
        @user = User.all
        erb :'/all_bets'
    end


    post '/user/live_bets' do
        @pendingbet = current_user.wagers.build(params[:wager])
        if @pendingbet.save
            redirect '/live_bets'
        else
            redirect '/user/place_wager'
        end
        # creates a new wager from the form in place_wager view and assigns to the user who is logged in
        # saves that wager
        # allows wager to be accessed by live_bets view
    end

    get '/live_bets' do
        @wager = current_user.wagers
        erb :'/user/live_bets'
        # gets a list of wagers with attributes from live_bets view of the current user
    end

    get '/live_bets/:id' do
        set_wager
        if current_user == @wager.user
            erb :'/user/edit_wager'
            # gets wager attributes from list of live bets view for current user and allows user to edit that wager
        else
            redirect '/'
        end
    end

    patch '/live_bets/:id' do
        set_wager
        if current_user == @wager.user && @wager.update(
            bet: params[:wager][:bet],
            amount: params[:wager][:amount],
        )
            redirect "/live_bets"
            # {@wager.id}
        else
            erb :'/user/edit_wager'
        end
    end


    # CRUD controller
    # Bets get pushed to active bets page where user can view all bets
    # User should also be able to edit and delete their own bets

    private
    def set_wager
      @wager = Wager.find_by_id(params[:id])
    end

end