require 'game_parameters'
require 'player_options'

RSpec.describe GameParameters do

  it 'extracts player option' do
    game_parameters = GameParameters.new({}, {'player_type' => '1'})

    expect(game_parameters.player_option).to eq PlayerOptions::HUMAN_VS_HUMAN
  end
end
