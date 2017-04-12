class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :current_user
 
  def index
  	@products = Product.order(price: :desc).limit(5)
  	
  end
  
  def current_user
    @user = User.find_by(id: session[:user_id])
  end
  helper_method :current_user
end
