class Placement < ActiveRecord::Base
  belongs_to :bet, inverse_of: :placements
  belongs_to :contestant
	validates :contestant, presence: true

	def save(*args)
    super
		rescue ActiveRecord::RecordNotUnique
    	bet.errors[:base] << "Duplicates"
    	false
  end
end
