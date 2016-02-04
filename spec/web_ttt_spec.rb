require 'ai_player'
require 'board'
require 'board_adapter'
require 'game_parameters'
require 'grid_formatter'
require 'player_options'
require 'player_symbols'
require 'players'
require 'web_ttt'

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
      GameParameters::MOVE => '3',
      GameParameters::GRID => '[0, 1, 2, 3, 4, 5, 6, 7, 8]'
    }

    session = {
      GameParameters::PLAYER_TYPE => '1'
    }

    web_ttt = WebTTT.new(GameParameters.new(params, session, BoardAdapter.new), players, GridFormatter.new)
    game_state = web_ttt.play_move

    expect(game_state.flatten_rows).to eq [0, 1, 2, PlayerSymbols::X, 4, 5, 6, 7, 8]
    expect(game_state.status).to eq nil

  end

  it 'takes human move and ai move on board' do
    expect(players).to receive(:create_players).and_return(
      {
        PlayerSymbols::X => UnreadyPlayer.new,
        PlayerSymbols::O => AiPlayer.new(PlayerSymbols::O)
      }
    )

    params = {
      GameParameters::MOVE => '3',
      GameParameters::GRID => '[0, 1, 2, 3, 4, 5, 6, 7, 8]'
    }

    session = {
      GameParameters::PLAYER_TYPE => '1'
    }

    web_ttt = WebTTT.new(GameParameters.new(params, session, BoardAdapter.new), players, GridFormatter.new)
    game_state = web_ttt.play_move

    expect(game_state.flatten_rows).to eq [0, 1, 2, PlayerSymbols::X, 4, 5, PlayerSymbols::O, 7, 8]
    expect(game_state.status).to eq nil
  end

  it 'takes automated move when no move provided' do
    expect(players).to receive(:create_players).and_return(
      {
        PlayerSymbols::X => AiPlayer.new(PlayerSymbols::O),
        PlayerSymbols::O => UnreadyPlayer.new,
      }
    )

    params = {}

    session = {
      GameParameters::PLAYER_TYPE => '1'
    }

    web_ttt = WebTTT.new(GameParameters.new(params, session, BoardAdapter.new), players, GridFormatter.new)
    game_state = web_ttt.play

    expect(game_state.flatten_rows).to eq [0, 1, 2, 3, 4, 5, 6, 7,  PlayerSymbols::X]
    expect(game_state.status).to eq nil
  end
end
