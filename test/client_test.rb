require 'test_helper'
require 'basketball_reference/client'

describe BasketballReference::Client, "Client" do
  let(:mj) { NBAPlayer.new('Michael Jordan') }

  it 'should return false for an unknown page' do
    assert_equal(false, BasketballReference::Client.new.open_webpage('http://www.espn.com/'))
  end
end
