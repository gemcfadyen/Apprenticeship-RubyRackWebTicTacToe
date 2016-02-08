require 'unready_player'

RSpec.describe UnreadyPlayer do

  it "is not ready" do
    expect(UnreadyPlayer.new.ready?).to be false
  end
end
