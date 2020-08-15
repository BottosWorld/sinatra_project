require 'json'

class DailySchedule::API 
    # < ActiveRecord::Base
    # belongs_to :mlb

    # example api url - https://api.sportsdata.io/v3/mlb/scores/json/GamesByDate/2020-AUG-05?key=2d27b767db0a475094b84f2f583e8de0

    def initialize
        @api_key = "?key=2d27b767db0a475094b84f2f583e8de0"
        @date = "#{Date.today.strftime("%Y-%b-%e")}"
        @url = "https://api.sportsdata.io/v3/mlb/scores/json/GamesByDate/"
    end

    def daily_baseball
        response = RestClient.get(@url + @date + @api_key)
        json = JSON(response)
            baseball_games = []
            json.each do |hash|
                baseball_hash = {}
                baseball_hash[:DateTime] = hash["DateTime"]
                baseball_hash[:awayteam] = hash["AwayTeam"]
                baseball_hash[:HomeTeam] = hash["HomeTeam"]
                baseball_hash[:Inning] = hash["Inning"].to_i
                baseball_hash[:InningHalf] = hash["InningHalf"]
                baseball_hash[:AwayTeamRuns] = hash["AwayTeamRuns"].to_i
                baseball_hash[:HomeTeamRuns] = hash["HomeTeamRuns"].to_i
                baseball_hash[:PointSpread] = hash["PointSpread"]
                baseball_hash[:OverUnder] = hash["OverUnder"]
                baseball_hash[:AwayTeamMoneyLine] = hash["AwayTeamMoneyLine"]
                baseball_hash[:HomeTeamMoneyLine] = hash["HomeTeamMoneyLine"]
                baseball_games.push(baseball_hash)
            end
            # baseball_games << json
        DailySchedule::Mlb.create_from_collection(baseball_games)
        # binding.pry
    end



end