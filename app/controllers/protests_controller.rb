class ProtestsController < ApplicationController
  def index
  	  @protests = Protest.visible(params)
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
  		redirect_to root_url #redirect to homepage
  	else
  		render 'new' # re-render form
  	end
  end

  private
  #In Rails 4, needed parameters must be marked as required
  def protest_params
    params.require(:protest).permit(:title, :date, :time, :starting_location, :state, :email, :organisation, :more_info, :website, :twitter, :facebook, :visible)
  end
end
