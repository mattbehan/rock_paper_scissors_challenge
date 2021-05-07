class Player 

	attr_accessor :name, :choice

	VALID_CHOICES = %w(Rock Paper Scissors)

	def initialize name
		@name = name
		@choice = nil
	end

	def self.valid_choice? choice
		VALID_CHOICES.any? choice
	end

	def random_choice
		VALID_CHOICES.sample
	end
end
