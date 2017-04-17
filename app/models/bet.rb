class Bet < ActiveRecord::Base
  belongs_to :contest
	has_many :placements, inverse_of: :bet
  validates :name, presence: true, uniqueness: true

	accepts_nested_attributes_for :placements
end
