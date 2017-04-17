class Bet < ActiveRecord::Base
  belongs_to :contest
	has_many :placements, inverse_of: :bet
  validates_uniqueness_of :name, message: 'Namnet finns redan registrerat, välj ett annat.'
	validates_presence_of :name, message: 'Du måste fylla i ett namn.'

	accepts_nested_attributes_for :placements
end
