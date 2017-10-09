require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')
require('minitest/autorun')
require('minitest/rg')

class TestRoom < Minitest::Test

  def setup
    @guest_1 = Guest.new('bad_singer', 30, @song_1)
    @guest_2 = Guest.new('worst_singer', 40, @song_2)
    @guest_3 = Guest.new('ok_singer', 30, @song_3)
    @guest_4 = Guest.new('vocoder_user', 90, @song_4)
    @guest_5 = Guest.new('great_singer', 8, @song_4)
    @song_1 = Song.new('any_artist','any_song')
    @song_2 = Song.new('any_artist','any_song')
    @song_3 = Song.new('any_artist','any_song')
    @song_4 = Song.new('any_artist','any_song')
    @room_1 = Room.new('Dive_Bar', 5, 10)
  end

  def test_room_has_name
    assert_equal('Dive_Bar', @room_1.name)
  end

  def test_check_how_many_songs_in_playlist
    assert_equal(0, @room_1.how_many_songs_in_playlist)
  end

  def test_check_how_many_guests
    assert_equal(0, @room_1.how_many_guests)
  end

  def test_room_can_check_in_guests
    @room_1.add_guest(@guest_1)
    assert_equal(1, @room_1.how_many_guests)
  end

  def test_room_can_check_out_guests
    @room_1.add_guest(@guest_1)
    @room_1.remove_guest(@guest_1)
    assert_equal(0, @room_1.how_many_guests)
  end

  def test_room_can_add_song_to_playlist
    @room_1.add_song_to_playlist(@song_1)
    assert_equal(1, @room_1.how_many_songs_in_playlist)
  end

  def test_room_can_add_song_to_currently_playing
    @room_1.add_song_to_currently_playing(@song_1)
    assert_equal(1, @room_1.how_many_songs_in_currently_playing)
  end

  def test_room_can_add_song_to_currently_playing__using_shuffle
    @room_1.add_song_to_playlist(@song_1)
    @room_1.add_song_to_currently_playing(@room_1.shuffle)
    assert_equal(1, @room_1.how_many_songs_in_currently_playing)
  end

  def test_return_room_capacity
    assert_equal(5, @room_1.capacity)
  end

  def test_check_room_capacity
    queue = []
    for guest in (1...9)
      queue.push(@guest_1)
    end
    @room_1.add_party(queue)
    assert_equal(5, @room_1.how_many_guests)
  end

  def test_room_has_price
    assert_equal(10, @room_1.price)
  end

  def test_get_wallet
    assert_equal(30, @guest_1.wallet)
  end

  def test_guest_can_pay__enough_money
    assert_equal(true, @room_1.check_if_guest_has_enough_money(@guest_1))
  end

  def test_guest_can_pay__not_enough_money
    assert_equal(false, @room_1.check_if_guest_has_enough_money(@guest_5))
  end


  def test_singer_likes_song
    @room_1.add_song_to_currently_playing(@song_1)
    assert_equal("**WHOOP WHOOP!!**", @room_1.check_favourite(@guest_1))
  end


  # def test_guest_can_chose_song
  #   assert_equal()
  # end
  #
  # def test_playlist_works
  #
  # end

end
