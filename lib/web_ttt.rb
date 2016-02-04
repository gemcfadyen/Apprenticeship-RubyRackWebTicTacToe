require 'game'

class WebTTT
  def initialize(game_parameters, players)
    @game_parameters = game_parameters
    @players = players
  end

  def play(move, board)
    game = Game.new(board, players.create_players(game_parameters.player_option))
    game.play_specific(game_parameters.move)
  end

  private

  attr_reader :game_parameters, :players
end
