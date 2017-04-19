class Product < ApplicationRecord
	has_many :charges
	has_many :transactions
end
