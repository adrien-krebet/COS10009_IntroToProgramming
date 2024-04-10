require './input_functions'

$genre_names = ['Pop', 'Classic', 'Jazz', 'Rock']

class Album
    attr_accessor :title, :artist, :genre, :tracks
    def initialize(title, artist, genre, tracks)
        @title = title
        @artist = artist
        @genre = genre
        @tracks = tracks
    end
end

class Track
    attr_accessor :name, :location
    def initialize(name, location)
        @name = name
        @location = location
    end
end

def finished
  return true
end

def read_albums(music_file, albums)
  albums = Array.new()
  read_count = music_file.gets.to_i
      index = 0
      while (index < read_count)
          albums.push(read_album(music_file))
          index += 1
      end
      music_file.close()
      read_string("#{read_count} albums loaded. Press enter to continue.")
  return albums
end


def read_album(music_file)
    album_artist = music_file.gets()
    album_title = music_file.gets()
    album_date = music_file.gets()
    album_genre = music_file.gets.to_i
    album_tracks = read_tracks(music_file)
    album = Album.new(album_title, album_artist, album_genre, album_tracks)
end

def display_albums_menu(albums)
    finished = false
    begin
      puts 'Display Album Menu:'
      puts '1 Display All Albums'
      puts '2 Display Albums by Genre'
      puts '3 Return to Main Menu'
      choice = read_integer_in_range("Please enter your choice:", 1, 3)
      case choice
      when 1
        print_albums(albums)
      when 2
        display_by_genre(albums)
      when 3
        finished = true
      else
        puts "Please select again"
      end
    end until finished
  end

def display_by_genre(albums)
  finished = false

# Adrien - please change the following to use a while loop
# and the array at the top of the code:
  begin
  
  # do it here
  while finished = false
    puts '1: Pop'
    puts '2: Classic'
    puts '3: Jazz'
    puts '4: Rock'
   finished = true
   end
    choice = read_integer_in_range("Pick a Genre:", 1, 4)
    index = search_for_track(choice)
    i = 0
    case choice
    when 1
      albums.each do |album|
      if album.genre == 1
        puts ("#{i + 1}: Title: " + album.title.chomp + " Artist: " + album.artist.chomp + " Genre: " + $genre_names[album.genre])
      end
    end
    when 2
      albums.each do |album|
      if album.genre == 2
        puts ("#{i + 1}: Title: " + album.title.chomp + " Artist: " + album.artist.chomp + " Genre: " + $genre_names[album.genre])
      end
    end
    when 3
      albums.each do |album|
      if album.genre == 3
        puts ("#{i + 1}: Title: " + album.title.chomp + " Artist: " + album.artist.chomp + " Genre: " + $genre_names[album.genre])
      end
    end
    when 4
      albums.each do |album|
      if album.genre == 4
        puts ("#{i + 1}: Title: " + album.title.chomp + " Artist: " + album.artist.chomp + " Genre: " + $genre_names[album.genre])
      end
    end
    else
      puts "Please put genre between 1-4"
    end
  end
  display_albums_menu(albums)
end

def search_for_track(choice)
found_index = -1
i = 0
  while (i < $genre_names.length)
      if ($genre_names[i] == choice)
        found_index = i
      end
      i += 1
    end
  return found_index
end

def read_tracks(music_file)
    tracks = Array.new()
    count = music_file.gets().to_i
    index = 0

    while (index < count)
    tracks.push(read_track(music_file))
    index += 1
    end
    tracks
end

def read_track(music_file)
    song_title = music_file.gets
    file_location = music_file.gets
    track = Track.new(song_title, file_location)
    track
end

def print_albums(albums)
  if (!albums)
    puts "No album has been read"
  else
    puts ""
    count = albums.length
    index = 0
    while (index < count)
      print ("#{index + 1}: ").chomp
      print_album(albums[index])
      index += 1
    end
  end
  read_string("Press enter to continue...")
end

def print_album(album)
    puts ("Title: " + album.title.chomp + " Artist: " + album.artist.chomp + " Genre: " + $genre_names[album.genre])
    tracks = album.tracks
end

def print_track(track)
    puts('Track name: ' + track.name)
end

def print_album_names(albums, album)
  if (!albums)
      puts "No albums have been read"
  else
    count = albums.length
    index = 0
      while (index < count)
      print ("#{index + 1}: ").chomp
      print_album(albums[index])
      index += 1
    end
      album_selection = read_integer_in_range("Enter Album number:", 1, count)
      print_album(albums[album_selection - 1])
      print_tracks(albums[album_selection - 1].tracks)

      track_selection = read_integer_in_range("Select a track to play", 1, (albums[album_selection].tracks.length + 1))
      puts "Playing track " + albums[album_selection - 1].tracks[track_selection - 1].name.chomp + " from album " + albums[album_selection - 1].title.chomp
      sleep(3.0)
      read_string("Press enter to continue...")
      end
  end

def print_tracks(tracks)
    count = tracks.length
    index = 0
    while (index < count)
      print ("#{index + 1} ").chomp
      print_track(tracks[index])
      index += 1
    end
end

def update_album(albums, album)
  if (!albums)
    puts "No album has been selected."
  else
    album_menu = true

    while (album_menu == true)
      index = 0
      count = albums.length
      modify_menu = true

      while (index < count)
        print ("#{index + 1}: ").chomp
        print_album(albums[index])
        index += 1
      end

      index = 0
      album_selection = modify_menu(albums)

      begin
        while (index < count && modify_menu == true)
          if (album_selection == (index + 1))
            puts "What to edit"
            puts "1: Title"
            puts "2: Genre"
            menu_choice = read_integer_in_range("Enter selection: ", 1, 2)
            case menu_choice
            when 1
              albums[album_selection - 1].title = read_string("Enter a new title for the Album: ")
              puts ("Title: " + albums[album_selection - 1].title + " Artist: " + albums[album_selection - 1].artist.chomp + " Genre: " + $genre_names[albums[album_selection - 1].genre])
            when 2
              albums[album_selection - 1].genre = read_integer_in_range("Enter a new genre for the Album: ", 1, 4) + 1
              puts ("Title: " + albums[album_selection - 1].title + " Artist: " + albums[album_selection - 1].artist.chomp + " Genre: " + $genre_names[albums[album_selection - 1].genre])
            else
              puts("Please select 1 or 2")
            end
          end
          read_string("Press enter to continue")
          return
        end
      end until finished
    end
  end
end

def modify_menu(albums)
  count = albums.length
  index = 0
    album_selection = read_integer_in_range("Enter the Album to edit:", 1, (index + 1))
    return album_selection
end


  def menu(finished, albums, album)
    while (!finished)
      puts "Main Menu:"
      puts "1. Read in Albums"
      puts "2. Display Albums"
      puts "3. Select Album to play"
      puts "4. Update an existing Album"
      puts "5. Exit the application"
      choice = read_integer_in_range("Please enter your choice: ", 1, 5)

      case choice
        when 1
          file_name = read_string("Enter a file path to an Album ")
          music_file = File.new(file_name, "r")
          albums = read_albums(music_file, albums)
        when 2
          display_albums_menu(albums)
        when 3
          print_album_names(albums, album)
        when 4
          albums = update_album(albums, album)
        when 5
          finished = finished()
      end
    end
  end

  def main
    finished = false;
    albums = nil
    album = nil
    menu(finished, albums, album)
  end

  main()