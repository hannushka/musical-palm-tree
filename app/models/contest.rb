class Contest < ActiveRecord::Base
	validates_uniqueness_of :name
	has_many :contestants, inverse_of: :contest, dependent: :destroy
	has_many :bets
	validates_presence_of :name, message: 'Du måste fylla i ett namn.'

	accepts_nested_attributes_for :contestants
end
