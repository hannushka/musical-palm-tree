class Bet < ActiveRecord::Base
  belongs_to :user
  belongs_to :contest
	has_many :placements
end
