class User < ActiveRecord::Base
    has_many :active_bets
    has_many :pending_bets
    belongs_to :master
    
    
    has_secure_password
  
    validates :email, presence: true, uniqueness: true

    
  end