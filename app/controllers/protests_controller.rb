class ProtestsController < ApplicationController

   before_filter :auth, only: [:create, :my_protests, :edit, :update, :destroy]
  def index
  	  @protests = Protest.visible(params)
     @heading = "All Protests"

     @protests = Protest.state(params) if params[:state]  #call state method in model - queries DB for records where
     #state = state param (if state param is passed)
     @heading = "#{params[:state]} Protests" if params[:state]

     @protests = Protest.hidden(params) if params[:visible] && current_user.try(:admin?)
     @heading = "Hidden Protests" if params[:visible] && current_user.try(:admin?)
  end

  def new
  	@protest = Protest.new
  end

  # create a new protest using form
  def create
    # create protest instance var with values submitted
    @protest = current_user.protests.new(protest_params)

	# attempt to save user
  	if @protest.save
  		flash[:success] = "Thank you, your protest has been posted"
  		redirect_to protests_path #redirect to homepage
  	else
      flash[:error] = "Sorry, your protest could not be registered. Please try again."
  		render :new # re-render form
  	end
  end

  def show
    @protest = Protest.find(params[:id]) #find Protest record with ID passed as param
    if current_user.try(:admin?)
      @user = User.find(@protest.user_id)
   end
  end

def my_protests
    @protests = current_user.my_protests(params)
end

def edit
   if current_user.try(:admin?)
      @protest = Protest.find(params[:id]) #if current user is an admin, can edit any record
   else
      #Ensure user can only edit his/her own protests by getting current user's protests and finding the correct
      #protest id - if user doesn't have a protest with that id, won't be able to edit.
      @protest = current_user.protests.find(params[:id])
   end

end

def update
   if current_user.try(:admin?)
      @protest = Protest.find(params[:id]) #if current user is an admin, can edit any record
   else
    #Ensure user can only edit his/her own protestss by getting current user's protests and finding the correct
    #protest id - if user doesn't have a protest with that id, won't be able to edit.
    @protest = current_user.protests.find(params[:id])
   end
    if @protest.update_attributes(params[:protest].permit(:title, :date, :time, :starting_location, :state, :email,
      :organisation, :more_info, :website, :twitter, :facebook, :visible, :march_route)) # attempt to update question
      #object's attributes with values submitted through form - must permit every attribute you want users to be able to update.
      flash[:success] = "Your protest has been updated."
      redirect_to @protest # redirect to updated protest
    else
      render 'edit' # if unsuccessful, render edit page again
    end

end

def destroy
   if current_user.try(:admin?)
      @protest = Protest.find(params[:id]) #if current user is an admin, can delete any record
   else
      @protest = current_user.protests.find(params[:id])
   end
   @protest.destroy
   redirect_to action: :index
end

 def search
    @protests = Protest.search(params) #create protests object by calling Protest model's search method and passing params [] (keyword from search form)
    @heading = "Search results - #{params[:keyword]}"
  end

  private
  #In Rails 4, needed parameters must be marked as required
  def protest_params
    params.require(:protest).permit(:title, :date, :time, :starting_location, :state, :email, :organisation,
    :more_info, :website, :twitter, :facebook, :visible, :march_route)
  end
end
