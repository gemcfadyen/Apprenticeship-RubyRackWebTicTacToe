require 'player_symbols'
require 'unready_player'

class Players

  def create_players(player_options)
    players = if player_options == PlayerOptions::HUMAN_VS_HUMAN
                {
                  PlayerSymbols::X => UnreadyPlayer.new,
                  PlayerSymbols::O => UnreadyPlayer.new
                }
              elsif player_options == PlayerOptions::HUMAN_VS_AI
                {
                  PlayerSymbols::X => UnreadyPlayer.new,
                  PlayerSymbols::O => AiPlayer.new(PlayerSymbols::O)
                }
              else
                {
                  PlayerSymbols::X => AiPlayer.new(PlayerSymbols::X),
                  PlayerSymbols::O => UnreadyPlayer.new
                }
              end
  end
end
