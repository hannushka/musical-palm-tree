class Contestant < ActiveRecord::Base
  belongs_to :contest
	has_many :placements
	validates :contest_id, presence: true
end
