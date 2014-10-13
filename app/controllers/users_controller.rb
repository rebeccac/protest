class UsersController < ApplicationController
  before_filter :authorise_admin

  def index
     @users = User.all_users(params)
  end

  def show
     @user = User.find(params[:id]) #find User record with ID passed as param
  end

  def edit
     @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User has been updated."
      redirect_to @user # redirect to updated protest
    else
      render 'edit' # if unsuccessful, render edit page again
    end
  end

  def destroy
     @user = User.find(params[:id]) #if current user is an admin, can delete any record
     @user.destroy
     redirect_to action: :index
   end

   private
   #In Rails 4, needed parameters must be marked as required
   def user_params
     params.require(:user).permit(:id, :email, :sign_in_count, :current_sign_in_ip, :last_sign_in_ip, :created_at, :admin)
   end

end
