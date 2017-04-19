class ChargesController < ApplicationController
  before_action :current_user
  
  def new
  end

  def create
  # Amount in cents
  # @product = Product.find(params[:id])
 # @product = Product.find(params[:product_id])
      # Amount in cents
      # @amount = (@product.price * 100).floor
      @amount = 120000
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
        )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
        )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
    private
    def charges_params
      params.require(:charges).permit(:product_id)
    end
  end
