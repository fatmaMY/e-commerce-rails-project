class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   # before_action :current_user
 add_flash_types :error, :danger
  def index
  	@products = Product.order(price: :desc).limit(5)
  	
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end
  
  
  def current_user
    @user = User.find_by(id: session[:user_id])
  end
  helper_method :current_user
  def logged_in?
       !current_user.nil?
   end

   # Confirms a logged-in user.
   def logged_in_user
      unless logged_in?
         flash[:danger] = "Please log in or sign up"
         redirect_to signin_path
      end
   end
   def must_be_admin
     unless current_user && current_user.is_admin
      flash[:error] = "You are not authorized !!"
      redirect_to root_path
    end
  end
end
