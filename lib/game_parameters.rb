require 'player_options'

class GameParameters

  PLAYER_TYPE = 'player_type'

  def initialize(params, session)
    @params = params
    @session = session
  end

  def player_option
    PlayerOptions::get_player_type_for_id(session[PLAYER_TYPE].to_i)
  end

  attr_reader :params, :session
end
