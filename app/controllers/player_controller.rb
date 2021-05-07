class PlayerController < ApplicationController

	def player_throw
		if Player.valid_throw?(params[:throw])
			respond_to do |format|
				format.js { render_partial "/player/computer_throw", player_throw: params[:throw]}
			end 
			# MAYBE SHOULD ADD NON JS OPTION AND SHOULD DEFINITELY ADD ERRORS
		end
	end
end