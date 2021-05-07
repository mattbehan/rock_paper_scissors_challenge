class GameController < ApplicationController
	def new_game
	end

	def finish_game
	end

	def player_throw
		print 'HELLLLLLOOOOOOO'
		puts params[:throw]
		puts params:[:throw]
		x = params[:throw]
		puts x.downcase
		if Player.valid_choice?(params[:throw])
			puts "============================"
			respond_to do |format|
				format.js { render :template => "/game/_computer_throw.js.erb", locals: {player_throw: params[:throw] } } 
				# format.js { render "/game/comp_throw" }
			end 
			# MAYBE SHOULD ADD NON JS OPTION AND SHOULD DEFINITELY ADD ERRORS
		end
	end


	# once button clicked, 
end