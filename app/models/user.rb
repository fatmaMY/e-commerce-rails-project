class User < ApplicationRecord
	validates :password, confirmation: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, length: { in: 6..20 }

end
