class User < ApplicationRecord
	validates_uniqueness_of :email, :name
	has_secure_password
end
