class GameController < ApplicationController
	def new_game
	end

	def player_throw
		x = params[:throw]
		if Player.valid_choice?(params[:throw])
			respond_to do |format|
				format.js { render :template => "/game/_wait.js.erb", locals: {player_throw: params[:throw] } } 
			end 
			# MAYBE SHOULD ADD NON JS OPTION AND SHOULD DEFINITELY ADD ERRORS
		end
	end

	# using post in case we later wanted to send full state
	def process_computer_throw_and_finish_game 
		@game = Game.process_computer_throw_and_finish_game params[:player_throw]
		respond_to do |format|
			format.js { render :template => "/game/_end_screen.js.erb", locals: { game: @game } }
		end
	end

end