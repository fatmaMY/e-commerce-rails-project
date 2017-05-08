class Admin::UsersController < ApplicationController
  before_action :must_be_admin, only: [:edit, :update, :destroy]
  # before_action :require_login
  # skip_before_action :require_login, only: [:index, :new]
   before_action :set_user, only: [:show, :edit, :update, :destroy]
  # skip_before_action :require_login, only: [:index, :new]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # set_user
    if @user.transactions
      @transactions = @user.transactions
      # display transactions
    else
      # display "Hey, you don't have any transactions yet!"
    end


    # IN VIEW
    # <% if @transactions %>
    #   <% @transactions.each do |t| %>
    #     <%= t.id %>
    #     <%= t.price %>
    #   <% end %>
    # <% end %>
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    # set_user
  end

  # POST /users
  # POST /users.json
  def create
    # set_user

    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def require_login
    return head(:forbidden) unless session.include? :user_id    
  end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :is_admin )
    end
end
