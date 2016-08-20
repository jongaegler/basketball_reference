require 'test_helper'

describe NBAPlayer, 'NBAPlayer' do
  let(:mj) { NBAPlayer.new('Michael Jordan') }
  let(:kat) {NBAPlayer.new('Karl Anthony Towns')}

  it 'should return last_name' do
    assert_equal('Jordan', mj.last_name)
  end

  it 'should return first_name' do
    assert_equal('Michael', mj.first_name)
  end

  it 'should return their Twitter handle if possible' do
    assert_equal('@KarlTowns', kat.twitter_handle)
  end

  it 'should return an array of nicknames' do
    result = mj.nicknames
    assert(result.is_a? Array)
    assert_equal('Mike', result.first)
  end

  it 'should return their bballref URL' do
    assert_equal(
      'http://www.basketball-reference.com/players/j/jordami01.html',
      mj.player_url
    )
  end
end
