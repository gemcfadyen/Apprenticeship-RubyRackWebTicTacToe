require 'rack/test'
require 'ttt_controller'

RSpec.describe TTTController do
  include Rack::Test::Methods

  it "can successfully load the page displaying the player options" do
    env = Rack::MockRequest.env_for(
      '/',
      'REQUEST_PATH' => '/'
    )

    status, header, body = TTTController::call(env)

    expect(status).to eq 200
  end


  it "can successfully load the page displaying the board" do
    env = Rack::MockRequest.env_for(
      '/',
      'REQUEST_PATH' => '/player_options',
      'REQUEST_METHOD' => 'POST'
    )

    status, header, body = TTTController::call(env)

    expect(status).to eq 200
  end

  it "can successfully make a move on the board" do
    env = Rack::MockRequest.env_for(
      '/',
      'REQUEST_PATH' => '/next_move',
      'REQUEST_METHOD' => 'GET',
      'params' => { 'move-taken' => '8', 'grid' => '[0, 1, 2, 3, 4, 5, 6, 7, 8]'},
      :input => "?move-taken=8&grid=[0, 1, 2, 3, 4, 5, 6, 7, 8]"
    )

    status, header, body = TTTController::call(env)

    expect(status).to eq 200
  end
end
