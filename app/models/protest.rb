class Protest < ActiveRecord::Base
  belongs_to :user

  	validates :title, presence: true, length: { in: 2..150 }
	validates :state, presence: true, length: { in: 2..3 }, inclusion: { in: ['ACT','NSW','NT','QLD','SA','TAS','VIC','WA'] }
	validates :starting_location, presence: true, length: { in: 5..150 }
   validates :march_route, length: { in: 10..500 }, :allow_blank => true
	validates :more_info, length: { in: 10..1000 }, :allow_blank => true
	validates :website, :url   => true, :allow_blank => true
	validates :visible, inclusion: { in: [true, false] } # visible field must contain value of either true or false

	def self.visible(params)
  		#return protests where visible attribute = true
  		# paginate, using will_paginate gem - 12 protests per page
  		where(visible: true).paginate(page: params[:page], order: 'created_at DESC', per_page: 12)
  	end
   def self.state(params)
      #return protests where visible attribute = true AND state attribute = state param passed by user
      #paginate, using will_paginate gem - 12 protests per page
      where(visible: true).where("state = ?", params[:state]).paginate(page: params[:page], order: 'created_at DESC', per_page: 12)
   end
   def self.hidden(params)
      where(visible: false).paginate(page: params[:page], order: 'created_at DESC', per_page: 12)
   end
   def self.search(params)
  	   where("title LIKE ? OR date LIKE ? OR time LIKE ? OR starting_location LIKE ? OR state LIKE ? OR email LIKE ?
        OR organisation LIKE ? OR more_info LIKE ? OR website LIKE ? OR twitter LIKE ? OR facebook LIKE ?
        OR march_route LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%",
        "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%",
        "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%").paginate(page: params[:page], order: 'created_at DESC',  per_page: 12)
        #pass keyword as interpolated string (inside %%) as second parameter rather than directly, to protect against SQL Injection.
   end

end
