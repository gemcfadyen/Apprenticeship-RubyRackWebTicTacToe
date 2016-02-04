require 'player_options'
require 'board_adapter'

class GameParameters
  PLAYER_TYPE = 'player_type'
  MOVE = 'move-taken'
  GRID = 'grid'

  def initialize(params, session)
    @params = params
    @session = session
  end

  def player_option
    PlayerOptions::player_type_for_id(session[PLAYER_TYPE].to_i)
  end

  def move
    params[MOVE].to_i
  end

  def board
    BoardAdapter.new.translate(params[GRID])
  end

  attr_reader :params, :session
end
