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
  		# paginate, using will_paginate gem - 10 protests per page
  		where(visible: true).paginate(page: params[:page], order: 'created_at DESC', per_page: 10)
  	end
end
