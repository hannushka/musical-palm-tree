class Placement < ActiveRecord::Base
  belongs_to :bet
  belongs_to :contestant
	validates :contestant, presence: true
end
