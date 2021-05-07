class Game

	attr_reader :player1, :player2, :players, :winner

	THROW_CHECKER = {
		Rock: [:Scissors],
		Paper: [:Rock],
		Scissors: [:Paper]
	}

	def initialize
		@player1, @player2, @winner = Player.new("Matt"), Player.new("Curb"), nil
		@players = [@player1, @player2]
		# @players, @winner = player_names.map { |i| Player.new(i)}, nil
	end

	def determine_winner
		player_one_choice, player_two_choice = @player1.choice.to_sym, @player2.choice.to_sym
		return nil if player_one_choice == player_two_choice
		THROW_CHECKER[player_one_choice].include? player_two_choice ? @winner = @player1 : @winner = @player2
	end

	def display_winner
		@winner ? "#{@winner.name} won with #{@winner.choice}" : "Tie!"
	end

	# before converting to symbol from player input we want to make sure it's a valid throw
	def process_and_respond_to_player_throw player_throw
		if Player.valid_choice? player_throw 
			@player1.choice = player_throw.to_sym
		end
	end
end
