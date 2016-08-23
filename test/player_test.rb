require 'test_helper'

describe BasketballReference::Player, 'Player' do
  let(:mj) { BasketballReference::Player.new('Michael Jordan') }
  let(:kat) { BasketballReference::Player.new('Karl Anthony Towns') }

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

  it 'should return their height' do
    assert_equal('6-6', mj.height)
  end

  it 'should return hall of fame status' do
    assert_equal(true, mj.hof?)
  end

  it 'should return their weight' do
    assert_equal(195, mj.weight)
  end

  it 'should return their high school' do
    assert_equal('Emsley A. Laney', mj.high_school)
  end

  it 'should return their college' do
    assert_equal('University of North Carolina', mj.college)
  end

  it 'should return draft info' do
    assert(mj.drafted?)
    assert_equal(1984, mj.drafted_in)
    assert_equal('Chicago Bulls', mj.drafted_by)
    assert_equal(3, mj.draft_pick)
  end
end
