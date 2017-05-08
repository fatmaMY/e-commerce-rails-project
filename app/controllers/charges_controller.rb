class ChargesController < ApplicationController
	before_action :logged_in_user

	def new
		@charge = Charge.new
	end
	def thanks
		@product = Product.find(params[:id])
	end
	def create
  # Amount in cents
  @product = Product.find(params[:id])
      # Amount in cents
      @amount = (@product.price * 100).floor

      customer = Stripe::Customer.create(
      	:email => params[:stripeEmail],
      	:source  => params[:stripeToken]
      	)

      charge = Stripe::Charge.create(
      	:customer    => customer.id,
      	:amount      => @amount,
      	:description => @product.id,
      	:currency    => 'usd'
      	)
      if charge["paid"] == true
      ch=Charge.new(stripeEmail:params[:stripeEmail],stripeToken: params[:stripeToken],product_id:@product.id)
      ch.save
      end
      redirect_to thanks_path id:@product.id

  rescue Stripe::CardError => e
  	flash[:error] = e.message
  	redirect_to new_charge_path
  end
  private
  def charges_params
  	params.require(:charge).permit(:transaction_id, :stripeEmail, :amount, :stripeToken, :product_id)

  end

end
