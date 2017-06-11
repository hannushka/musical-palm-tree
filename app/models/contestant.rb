class Contestant < ActiveRecord::Base
  belongs_to :contest
	has_many :placements, inverse_of: :contestant
	validates_presence_of :contest, message: 'Du måste fylla i ett namn.'
	validates_presence_of :country, message: 'Du måste fylla i ett land för varje bidrag.'
	validates_presence_of :title, message: 'Du måste fylla i en titel för varje bidrag.'

	def complete_title
		complete_title = country + ", " + title
	end
end
