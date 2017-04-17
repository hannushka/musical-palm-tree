class Placement < ActiveRecord::Base
  belongs_to :bet, inverse_of: :placements
  belongs_to :contestant, inverse_of: :placements
	validates :contestant, presence: true
	validates_numericality_of :position, only_integer: true, message: 'Error.'

	def save(*args)
    super
		rescue ActiveRecord::RecordNotUnique
    	bet.errors[:base] << "Du har valt #{contestant.title} flera gånger."
    	false
  end
end
