class PagesController < ApplicationController
before_filter :authorise_admin, only: :admin
def index
     @recent_protests = Protest.all(:order => "id desc", :limit => 6).reverse
  end

  def related_sites
  end

  def admin
  end

end
