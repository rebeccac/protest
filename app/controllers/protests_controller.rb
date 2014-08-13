class ProtestsController < ApplicationController
  def index
  	  @protests = Protest.visible(params)
  end

  def new
  	@protest = Protest.new
  end

  def create
  	#create Protest instance and pass it the Protest variable submitted via form
  	@protest = Protest.new(protest_params) #get protest parameters submitted via form from protest_params method
	
	#attempt to save user
  	if @protest.save #if Protest instance saves successfully, send success flash message
  		flash[:success] = "Thank you, your protest has been posted"
  		redirect_to root_url #redirect to homepage
  	else
  		render 'http://www.google.com'
  	end
  end

  private
  #In Rails 4, needed parameters must be marked as required
  def protest_params
    params.require(:protest).permit(:title, :date, :time, :state, :visible)
  end
end
