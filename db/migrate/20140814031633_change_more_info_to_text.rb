class ChangeMoreInfoToText < ActiveRecord::Migration
  def change
  	def change
    	change_column :protests, :more_info, :text
  	end
  end
end
