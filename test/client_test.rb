require 'test_helper'
require 'basketball_reference/client'

describe Client, "Client" do
  let(:mj) { NBAPlayer.new('Michael Jordan') }

  it 'should return false for an unknown page' do
    assert_equal(false, Client.new.open_webpage(Client::URL + '/not-a-page'))
  end
end
