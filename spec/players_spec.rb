require 'players'
require 'player_symbols'
require 'player_options'
require 'unready_player'
require 'ai_player'

RSpec.describe Players do

  it "creates two players who are not ready" do
    players = Players.new.create_players(PlayerOptions::HUMAN_VS_HUMAN)
    expect(players[PlayerSymbols::X].class).to be UnreadyPlayer
    expect(players[PlayerSymbols::O].class).to be UnreadyPlayer
  end

  it "creates a player who is not ready and a ai player" do
    players = Players.new.create_players(PlayerOptions::HUMAN_VS_AI)
    expect(players[PlayerSymbols::X].class).to be UnreadyPlayer
    expect(players[PlayerSymbols::O].class).to be AiPlayer
  end


  it "creates an ai player and a player who is not ready" do
    players = Players.new.create_players(PlayerOptions::AI_VS_HUMAN)
    expect(players[PlayerSymbols::X].class).to be AiPlayer
    expect(players[PlayerSymbols::O].class).to be UnreadyPlayer
  end
end
