class Room

  attr_reader(:name, :capacity)
  attr_accessor(:price, :currently_playing)

  def initialize(name, capacity, price)
    @name = name
    @capacity = capacity
    @guests = []
    @playlist  = []
    @currently_playing = []
    @price = price
  end

  def name
    return @name
  end

  def how_many_guests
    return @guests.count
  end

  def how_many_songs_in_playlist
    return @playlist.count
  end

  def how_many_songs_in_currently_playing
    return @currently_playing.count
  end

  def add_guest(guest)
    @guests.push(guest)
  end

  def remove_guest(guest)
    @guests.delete(guest)
  end

  def add_song_to_playlist(song)
    @playlist.push(song)
  end

  def add_song_to_currently_playing(song)
    @currently_playing.push(song)
  end

  def add_party(guests)
    for guest in (guests)
      if how_many_guests < @capacity
        add_guest(guest)
      else
        return "Close the door!"
      end
    end
  end

  def check_if_guest_has_enough_money(guest)
    if guest.wallet > @price
      return true
    else
      return false
    end
  end

  def pay(guest)
    if check_if_guest_has_enough_money == true
      guest.wallet -= @price
    end
  end



  ##fancy methods here##
  #
  # def sort by number
  #
  # end
  #
  def shuffle
      if @currently_playing.length != 0
        @currently_playing.clear
        number_of_songs = how_many_songs_in_playlist
        song_index = rand(0..number_of_songs)
        #cool move here; number of songs -1; is this why I am getting the error?
        add_song_to_currently_playing(@playlist[song_index])
      else
        number_of_songs = how_many_songs_in_playlist
        song_index = rand(0..number_of_songs)
        add_song_to_currently_playing(@playlist[song_index])
      end
  end

  def check_favourite(guest)
    if @currently_playing == guest.favourite_song
      return "**WHOOP WHOOP!!**"
    end
  end
  ##cannot spot why this is not working
end
