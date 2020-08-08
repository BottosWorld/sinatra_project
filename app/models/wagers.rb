class Wager < ActiveRecord::Base
    belongs_to :user
    validates :bet, presence: true
    validates :amount, presence: true
  end