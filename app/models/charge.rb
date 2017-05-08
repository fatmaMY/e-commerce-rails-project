class Charge < ApplicationRecord
	belongs_to :product
	has_many :transactions
	
end
