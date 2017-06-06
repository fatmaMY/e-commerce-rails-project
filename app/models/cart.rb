class Cart < ApplicationRecord
	has_many :cart_items
  has_many :products, :through => :cart_items
  belongs_to :user
  attr_accessor :add_product

 #  def add_product(product_params)
 #  	current_item = cart_items.find_by(product_id: product_params[:product_id])
 #  	if current_item
 #        # current_item.quantity ||= 0
 #       # current_item.quantity + 1
 #    # save
 #    # @cart.cart_items.find(:first, :conditions =>{:product_id => @product.id}).increment! :quantity
 #  		  current_item.quantity += product_params[:quantity].to_i
 #  		current_item.save
 #  	else
 #  		current_item = cart_items.create(product_id: product_params[:product_id],
 #  			quantity: product_params[:quantity],
 #        pirce: [:pirce],
 #  			cart_id: self.id)
     
 #  	end
 #  	current_item
 #  end
 #  def total_price
 #   # cart_items.to_a.sum(&:pirce)
 #   cart_items.collect { |item| item.valid? ? (item.quantity * item.price) : 0 }.sum
 # end
end
