class CartItemsController < ApplicationController

 before_action :current_cart, only: [:create, :destroy]
 before_action :set_cart_item , only: [:destroy]



 def create
 	@cart.add_product(params)
 	if @cart.save
 		redirect_to cart_path(@cart.id)
 	else
 		flash[:error] = 'There was a problem in adding this product'
 		redirect_to products_path
 	end
 end

 def destroy
 	@cart_item.destroy
 	redirect_to cart_path
 end 

 private
def set_cart_item
	@cart_item = @cart.cart_items.find(params[:item_id])
end
def cart_item_params
	params.require(:cart_item).permit(:product_id, :cart_id, :quantity, :pirce)
end
end

