require_relative('../guest.rb')
require_relative('../song.rb')
require('minitest/autorun')
require('minitest/rg')

class TestGuest < Minitest::Test

  def setup
    @song1 = Song.new('that_artist','that_song')
    @guest_1 = Guest.new('Miguel', 25, @song1)
  end

  def test_name
    assert_equal('Miguel', @guest_1.name)
  end

  def test_wallet
    assert_equal(25, @guest_1.wallet)
  end

  def test_favourite_song
    assert_equal('that_song', @song1.title)
  end
end
