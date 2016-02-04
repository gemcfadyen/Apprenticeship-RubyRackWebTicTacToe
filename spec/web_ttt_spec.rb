require 'web_ttt'
require 'board'
require 'player_symbols'
require 'player_options'
require 'players'

RSpec.describe WebTTT do
  let (:players) { instance_double(Players) }

  it 'takes a move on the board' do
    expect(players).to receive(:create_players)

    web_ttt = WebTTT.new(PlayerOptions::HUMAN_VS_HUMAN, players)
    updated_board = web_ttt.play(3, Board.new)

    expect(updated_board.symbol_at(3)).to eq PlayerSymbols::X
  end
end
