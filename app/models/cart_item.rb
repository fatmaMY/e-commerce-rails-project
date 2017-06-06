class CartItem < ApplicationRecord
	belongs_to :cart
  belongs_to :product

   def add_product(product_params)
  	current_item = CartItem.find_by(product_id: product_params[:product_id])
  	if current_item
        # current_item.quantity ||= 0
       # current_item.quantity + 1
    # save
    # @cart.cart_items.find(:first, :conditions =>{:product_id => @product.id}).increment! :quantity
  		  current_item.quantity += product_params[:quantity].to_i
  		current_item.save
  	else
  		current_item = CartItem.create(product_id: product_params[:product_id],
  			quantity: product_params[:quantity],
        pirce: [:pirce],
  			cart_id: self.id)
     
  	end
  	current_item
  end
  def total_price
   # cart_items.to_a.sum(&:pirce)
   CartItem.collect { |item| item.valid? ? (item.quantity * item.price) : 0 }.sum
 end
  
end
#put the add product method
