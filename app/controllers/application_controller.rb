class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  	@products = Product.all.last(5)
  	
  end
end
