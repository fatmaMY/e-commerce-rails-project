class Transaction < ApplicationRecord
	belongs_to :user
	has_many :products
	belongs_to :charge
end


# Mock of a Transaction object
{
	user_id: 1,
	total_price: 302,
	total_number_of_products: 5,
	products: {
		"computer": {
			quantity: 4,
			price: 75
		},
		"banana": {
			quantity: 1,
			price: 2
		}
	},
	date_time: "20170101T12:00" # (whatever a date time object in Ruby looks like)
}