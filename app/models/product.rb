class Product < ApplicationRecord
	has_many :charges
	has_many :cart_items
  has_many :carts, :through => :cart_items
end
