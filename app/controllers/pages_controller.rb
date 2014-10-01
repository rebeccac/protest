class PagesController < ApplicationController
  def index
     @recent_protests = Protest.all(:order => "id desc", :limit => 6).reverse
     render :layout => 'frontpage'
  end

  def related_sites
  end
end
