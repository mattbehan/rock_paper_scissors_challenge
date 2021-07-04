class Game

	attr_reader :player1, :player2, :players, :winner, :errors

	THROW_CHECKER = {
		Rock: [:Scissors],
		Paper: [:Rock],
		Scissors: [:Paper]
	}

	def initialize
		@player1, @player2, @winner, @errors = Player.new("Matt"), Player.new("Curb"), nil, []
		@players = [@player1, @player2]
		# @players, @winner = player_names.map { |i| Player.new(i)}, nil
	end

	def determine_winner
		player_one_choice = @player1.choice.to_sym
		player_two_choice = @player2.choice.to_sym
		if player_one_choice == player_two_choice
			return nil
		elsif 
			THROW_CHECKER[player_one_choice].include? player_two_choice
			@winner = player1
		else
			@winner = player2
		end
		puts @winner
	end

	def display_winner
		@winner ? "#{@winner.name} won with #{@winner.choice}" : "Tie!"
	end

	# before converting to symbol from player input we want to make sure it's a valid throw
	def process_player_throw player_throw
		Player.valid_choice? player_throw ? @player1.choice = player_throw.to_sym : @errors["Invalid Player Throw"] = player_throw + "Is not one of the valid options of this game"
	end

	def self.process_computer_throw_and_finish_game player_throw
		game = Game.new
		game.process_player_throw player_throw
		game.player2.choice = game.player2.computer_throw
		game.determine_winner
		puts game
		return game
	end

	def end_message
		if @winner == @player1
			"YOU WON!"
		elsif @winner == @player2
			"YOU LOST!"
		else
			"Tie"
		end
	end
end