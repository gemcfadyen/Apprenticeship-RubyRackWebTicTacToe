require 'rack/test'
require 'rack_router'

ENV['RACK_ENV'] = 'test'

RSpec.describe RackRouter do
  include Rack::Test::Methods

  def app
    RackRouter
  end

  it "successfully loads player option page" do
    env = Rack::MockRequest.env_for('/',
                                    "REQUEST_METHOD" => 'GET',
                                    "REQUEST_PATH" => '/')
    status, headers, body = RackRouter::call(env)

    expect(status).to eq 200
  end

  it "can successfully select player option" do
    env =  Rack::MockRequest.env_for("/player_options",
                                     "REQUEST_METHOD" => 'POST',
                                     "REQUEST_PATH" => '/player_options',
                                     :params => {:player_type => '1'},
                                     :input => 'player_type=1')
    status, headers, body = RackRouter::call(env)

    expect(status).to eq 200
  end

  it "can succesfully make a move request" do

    env =  Rack::MockRequest.env_for("/next_move",
                                     "REQUEST_METHOD" => 'GET',
                                     "REQUEST_PATH" => '/next_move',
                                     "rack.session" => { :player_type => '1' },
                                     :params => {'move-taken'=> '2', 'grid' => '[0, 1, 2, 3, 4, 5, 6, 7, 8]'},
                                     :input => 'move-taken=2&grid=[0, 1, 2, 3, 4, 5, 6, 7, 8]')

    status, headers, body = RackRouter::call(env)

    expect(status).to eq 200
  end
end
