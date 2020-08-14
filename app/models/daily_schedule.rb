require "rest-client"
require "json"
require "pry"

module DailySchedule
  class Error < StandardError; end
  # Your code goes here...
end

require_relative "./daily_schedule/api"
require_relative "./daily_schedule/mlb"