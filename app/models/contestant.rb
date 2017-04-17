class Contestant < ActiveRecord::Base
  belongs_to :contest
	has_many :placements, inverse_of: :contestant
	validates :contest_id, presence: true
end
