class Contest < ActiveRecord::Base
	has_many :contestants
	has_many :bets
end
