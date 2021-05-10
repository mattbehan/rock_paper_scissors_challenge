Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'game#new_game', as: "new_game"
  post '/game/player_throw' => 'game#player_throw'

  post 'game/process_computer_throw_and_finish_game' => 'game#process_computer_throw_and_finish_game'
end
