class Bet < ActiveRecord::Base
  belongs_to :contest
	has_many :placements

	accepts_nested_attributes_for :placements
end
