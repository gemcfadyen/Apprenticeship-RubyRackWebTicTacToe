require 'player_options'

class GameParameters
  PLAYER_TYPE = 'player_type'
  MOVE = 'move-taken'
  GRID = 'grid'

  def initialize(params, session, board_adapter)
    @params = params
    @session = session
    @board_adapter = board_adapter
  end

  def player_option
    PlayerOptions::player_type_for_id(session[PLAYER_TYPE].to_i)
  end

  def move
    params[MOVE].to_i
  end

  def board
    params[GRID].nil? ?
      board_adapter.translate :
      board_adapter.translate(params[GRID])
  end

  attr_reader :params, :session, :board_adapter
end
