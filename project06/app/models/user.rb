class User < ActiveRecord::Base
  has_many :games
  acts_as_authentic
end
