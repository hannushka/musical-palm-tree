class Contestant < ActiveRecord::Base
  belongs_to :contest
	validates :contest_id, presence: true
end
