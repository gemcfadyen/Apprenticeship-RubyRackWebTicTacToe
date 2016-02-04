require 'game'

class WebTTT
  def initialize(player_option, players) # maybe pass the GameParameters in and extract here rather than outside
    @player_option = player_option
    @players = players
  end

  def play(move, board)

    game = Game.new(board, players.create_players(player_option))
    game.play_specific(move)
  end

  private

  attr_reader :player_option, :players
end
