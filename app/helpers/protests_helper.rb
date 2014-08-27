module ProtestsHelper

   def on_my_protests_page?
   		action_name == 'my_protests' #action_name method returns name of action currently on. Check if equal to my_protests
   	end

end
