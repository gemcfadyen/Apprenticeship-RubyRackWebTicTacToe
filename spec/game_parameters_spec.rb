require 'board_adapter'
require 'game_parameters'
require 'player_options'

RSpec.describe GameParameters do

  it 'extracts player option' do
    game_parameters = GameParameters.new({}, {'player_type' => '1'}, BoardAdapter.new)

    expect(game_parameters.player_option).to eq PlayerOptions::HUMAN_VS_HUMAN
  end

  it 'extracts chosen move' do
    game_parameters = GameParameters.new({'move-taken' => '3'}, {}, BoardAdapter.new)
    expect(game_parameters.move).to eq 3
  end

  it 'extracts current board' do
    game_parameters = GameParameters.new({'move-taken' => '2', 'grid' => '[0, 1, 2, 3, :X, :O, 6, 7, 8]'}, {}, BoardAdapter.new)
    expect(game_parameters.board.grid_for_display).to eq [[nil, nil, nil], [nil, PlayerSymbols::X, PlayerSymbols::O], [nil, nil, nil]]
  end

  it 'defaults to empty board' do
    game_parameters = GameParameters.new({}, {'player-type' => '2'}, BoardAdapter.new)
    expect(game_parameters.board.grid_for_display).to eq [[nil, nil, nil], [nil, nil, nil,], [nil, nil, nil]]
  end
end
