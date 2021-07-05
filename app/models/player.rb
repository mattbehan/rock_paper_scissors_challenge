require 'uri'
require 'net/http'

class Player 

	attr_accessor :name, :choice
	attr_reader :computer_throw

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

	def computer_throw
		# make an API request to the url. if it fails, the choice will be set by random_choice
		uri = URI('https://5eddt4q9dk.execute-api.us-east-1.amazonaws.com/rps-stage/throw')
		res = Net::HTTP.get_response(uri)
		parsed = res.body
		# remove quotes from responses
		formatted_body = parsed.gsub(/\"/, '')
		(res.is_a?(Net::HTTPSuccess) && parsed["statusCode"] == 200 && self.class.valid_choice?(formatted_body)) ? formatted_body.capitalize : random_choice
	end
end
