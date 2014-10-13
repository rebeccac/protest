class UsersController < ApplicationController
  before_filter :authorise_admin

  def index
     @users = User.all_users(params)
  end

  def show
     @user = User.find(params[:id]) #find User record with ID passed as param

  end

   private
   #In Rails 4, needed parameters must be marked as required
   def user_params
     params.require(:user).permit(:id, :email, :sign_in_count, :current_sign_in_ip, :last_sign_in_ip, :created_at, :admin)
   end

end
