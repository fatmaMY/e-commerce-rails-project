class SessionsController < ApplicationController
  # def new
  # end

  def create

  	 user = User.find_by(first_name: params[:first_name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Logged in!'
    else
      flash.now.alert = "Invalid first name or password"
      render :new
    end
  end

  def hello
		if session[:first_name]
			redirect_to controller: 'sessions', action: 'create'
		end
	end

  def destroy
  session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
end
end
