require 'rack/test'
require 'ttt_controller'
require 'game_parameters'

RSpec.describe TTTController do
  include Rack::Test::Methods

  it "can successfully load the page displaying the player options" do
    env = Rack::MockRequest.env_for(
      '/',
      'REQUEST_PATH' => '/',
      'REQUEST_METHOD' => 'GET'
    )

    status, header, body = TTTController::call(env)

    expect(status).to eq 200
  end


  it "can successfully load the page displaying the board" do
    env = Rack::MockRequest.env_for(
      '/',
      'REQUEST_PATH' => '/player_options',
      'REQUEST_METHOD' => 'POST',
      :params => {:player_type => '1'},
      :input => "#{GameParameters::PLAYER_TYPE}=1",
      'rack.session' => {}
    )

    status, header, body = TTTController::call(env)

    expect(status).to eq 200
    expect(env['rack.session'][GameParameters::PLAYER_TYPE]).to eq '1'
  end

  it "can successfully make a move on the board" do
    env = Rack::MockRequest.env_for(
      '/',
      'REQUEST_PATH' => '/next_move',
      'REQUEST_METHOD' => 'GET',
      'params' => { 'move-taken' => '8', 'grid' => '[0, 1, 2, 3, 4, 5, 6, 7, 8]'},
      'rack.session' => { GameParameters::PLAYER_TYPE => "1"},
      :input => "?move-taken=8&grid=[0, 1, 2, 3, 4, 5, 6, 7, 8]"
    )

    status, header, body = TTTController::call(env)

    expect(status).to eq 200
  end
end
