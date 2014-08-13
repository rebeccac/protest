class Protest < ActiveRecord::Base
	validates :title, presence: true, length: { in: 2..150 }
	validates :state, presence: true, length: { in: 2..3 }, inclusion: { in: ['ACT','NSW','NT','QLD','SA','TAS','VIC','WA'] }
	validates :visible, inclusion: { in: [true, false] } # visible field must contain value of either true or false

	def self.visible(params)
  		#return protests where visible attribute = true
  		where(visible: true)
  	end
end
