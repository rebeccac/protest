class Protest < ActiveRecord::Base
  belongs_to :user

  	validates :title, presence: true, length: { in: 2..150 }
	validates :state, presence: true, length: { in: 2..3 }, inclusion: { in: ['ACT','NSW','NT','QLD','SA','TAS','VIC','WA'] }
	validates :starting_location, presence: true, length: { in: 5..150 }
	validates :more_info, length: { in: 10..1000 }, :allow_blank => true
	validates :website, :url   => true, :allow_blank => true
	validates :visible, inclusion: { in: [true, false] } # visible field must contain value of either true or false

	def self.visible(params)
  		#return protests where visible attribute = true
  		where(visible: true)
  	end
end
