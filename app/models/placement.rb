class Placement < ActiveRecord::Base
  belongs_to :bet, inverse_of: :placements
  belongs_to :contestant, inverse_of: :placements
	validates_presence_of :contestant_id, message: "Du får inte skicka in tomma placeringar."

	def save(*args)
    super
		rescue ActiveRecord::RecordNotUnique
    	bet.errors[:base] << "Du har valt #{contestant.complete_title} flera gånger."
			errors.add(:contestant_id, "Du har valt #{contestant.complete_title} flera gånger.")
    	false
  end
end
