class Master < ActiveRecord::Base
    has_many :users
    validates :title, presence: true

    has_secure_password
  
    validates :email, presence: true, uniqueness: true
    
end