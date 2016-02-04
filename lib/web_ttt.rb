require 'game'
require 'game_state'
require 'grid_formatter'

class WebTTT
  def initialize(game_parameters, players, grid_formatter)
    @game_parameters = game_parameters
    @players = players
    @grid_formatter = grid_formatter
  end

  def play_move
    updated_board = create_game(game_parameters, players).play_specific(game_parameters.move)
    GameState.new(grid_formatter.format(updated_board), PlayerSymbols::all,print_game_status(updated_board))
  end

  def play
    updated_board = create_game(game_parameters, players).play
    GameState.new(grid_formatter.format(updated_board), PlayerSymbols::all, print_game_status(updated_board))
  end
  private

  attr_reader :game_parameters, :players, :grid_formatter

  def print_game_status(board)
    if board.winning_combination?
      return "The game has been won by #{board.winning_symbol}"
    end

    if !board.free_spaces?
      return "The game is a draw!"
    end
  end

  def create_game(game_parameters, palyers)
    Game.new(game_parameters.board, players.create_players(game_parameters.player_option))
  end
end
