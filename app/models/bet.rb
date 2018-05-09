class Bet < ActiveRecord::Base
  belongs_to :contest
	has_many :placements, inverse_of: :bet, dependent: :destroy
	validates_presence_of :name, message: 'Du måste fylla i ett namn.'
	validates_uniqueness_of :name, scope: :contest_id, message: 'Namnet finns redan registrerat, välj ett annat.' 
	accepts_nested_attributes_for :placements
	validates_associated :placements, message: "Du får inte skicka in tomma placeringar."

	def result
		if self.contest.completed
			@points = 0
			self.placements.each do |p|
				@points = @points + (p.position-p.contestant.position).abs
			end
			return @points
		else
			return nil
		end
	end

end
