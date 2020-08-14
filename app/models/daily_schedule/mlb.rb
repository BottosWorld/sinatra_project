class DailySchedule::Mlb 
    # < ActiveRecord::Base
    # has_many :apis
    
    attr_accessor :DateTime, :AwayTeam, :HomeTeam, :Inning, :InningHalf, :AwayTeamRuns, :HomeTeamRuns, :PointSpread, :OverUnder, :AwayTeamMoneyLine, :HomeTeamMoneyLine

    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value)
        end
    end

    def save
        @@all << self unless @@all.include?(self)
    end

    def self.create(hash)
        baseball = self.new(hash)
        baseball.save
        baseball
    end

    def self.create_from_collection(array)
        array.each do |baseball_hash|
            self.create(baseball_hash)
        end
    end

    def self.all
        @@all
    end

    # def self.datetime
    #     @datetime
    # end

end