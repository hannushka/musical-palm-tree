class Placement < ActiveRecord::Base
  belongs_to :bet, inverse_of: :placements
  belongs_to :contestant, inverse_of: :placements
	validates_presence_of :contestant_id, message: "Du får inte skicka in tomma placeringar."

	def save(*args)
		begin
			super
		rescue ActiveRecord::RecordNotUnique
			if Rails.env.production?
				ActiveRecord::Base.connection.execute 'ROLLBACK'
			end
			bet.errors[:base] << "Du har valt #{contestant.complete_title} flera gånger."
			errors.add(:contestant_id, "Du har valt #{contestant.complete_title} flera gånger.")
    	false
		end
  end
end
