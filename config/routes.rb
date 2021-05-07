Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'game#new_game', as: "new_game"
  post '/game/player_throw' => 'game#player_throw', as: "game_player_throw"
end
