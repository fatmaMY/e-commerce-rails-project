class CartItemsController < ApplicationController

 before_action :current_cart, only: [:create, :destroy]
 before_action :set_cart_item , only: [:destroy]
#  before_action :current_cart, only: [:create, :update, :destroy]
# before_action :set_cart_item, only: [:show, :edit, :update, :destroy]


 def create
 	@cart.add_product
 	if @cart.save
 		redirect_to cart_path(@cart.id)
 	else
 		flash[:error] = 'There was a problem in adding this product'
 		redirect_to products_path
 	end
 end
  def update
    @cart_item.update(quantity: params[:quantity]) if @cart_item

    if @cart_item.save
      render json: { pirce: @cart_item.quantity * @cart_item.product.price, subtotal: @cart.total_price }
    else
      flash.now[:error] = 'There was a problem updating your shopping bag.'
    end
  end

 def destroy
 	@cart_item.destroy
 	redirect_to cart_path
 end 

 private
def set_cart_item
	# @cart_item = @cart.cart_items.find(params[:item_id])
  @cart_item = CartItem.find(params[:id])
	# @cart_item = @cart.cart_items..find_by(id: params[:item_id])
end
def cart_item_params
	params.require(:cart_item).permit(:product_id, :cart_id, :quantity, :pirce)
end
end
