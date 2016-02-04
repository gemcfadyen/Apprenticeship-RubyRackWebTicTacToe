require 'web_ttt'
require 'board'
require 'player_symbols'
require 'player_options'
require 'players'
require 'ai_player'
require 'game_parameters'

RSpec.describe WebTTT do
  let (:players) { instance_double(Players) }

  it 'takes a move on the board' do
    expect(players).to receive(:create_players).and_return(
      {
        PlayerSymbols::X => UnreadyPlayer.new,
        PlayerSymbols::O => UnreadyPlayer.new
      }
    )

    params = {
      GameParameters::MOVE => '3'
    }

    session = {
      GameParameters::PLAYER_TYPE => '1'
    }

    web_ttt = WebTTT.new(GameParameters.new(params, session), players)
    updated_board = web_ttt.play(3, Board.new)

    expect(updated_board.symbol_at(3)).to eq PlayerSymbols::X
    expect(updated_board.vacant_indices.size).to eq 8
  end

  it 'takes human move and ai move on board' do
    expect(players).to receive(:create_players).and_return(
      {
        PlayerSymbols::X => UnreadyPlayer.new,
        PlayerSymbols::O => AiPlayer.new(PlayerSymbols::O)
      }
    )

    params = {
      GameParameters::MOVE => '3'
    }

    session = {
      GameParameters::PLAYER_TYPE => '1'
    }

    web_ttt = WebTTT.new(GameParameters.new(params, session), players)
    updated_board = web_ttt.play(3, Board.new)

    expect(updated_board.symbol_at(3)).to eq PlayerSymbols::X
    expect(updated_board.vacant_indices.size).to eq 7
  end
end
