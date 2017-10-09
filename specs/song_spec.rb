require_relative('../song.rb')
require('minitest/autorun')
require('minitest/rg')

class TestSong < Minitest::Test

  def setup
    @song_1 = Song.new('any_artist', 'any_song')
  end

  def test_song_has_artist
    assert_equal('any_artist', @song_1.artist)
  end

  def test_song_has_title
    assert_equal('any_song', @song_1.title)
  end

end
