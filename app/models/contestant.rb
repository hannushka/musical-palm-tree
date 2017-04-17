class Contestant < ActiveRecord::Base
  belongs_to :contest
	has_many :placements, inverse_of: :contestant
	validates_presence_of :contest

	def complete_title
		complete_title = country + ", " + title
	end
end
