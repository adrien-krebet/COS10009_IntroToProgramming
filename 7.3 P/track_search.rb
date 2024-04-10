require './input_functions'

# Task 6.1 T - use the code from 5.1 to help with this

class Track
  attr_accessor :name, :location

  def initialize (name, location)
    @name = name
    @location = location
  end
end


def read_track(music_file)
  name = music_file.gets()
  location = music_file.gets()
  puts(name)
  puts(location)
  track = Track.new(name, location)
  return track
end

def read_tracks(music_file)
  count = music_file.gets().to_i
  tracks = Array.new()
  track = File.open('album.txt')
  i = 0
  while (i < count)
    track = read_track(music_file)
    tracks << track
    i += 1
  end
  return tracks
end

def print_tracks tracks
  index = 0
  while index < tracks.length
    print_track tracks[index]
    index += 1
  end
end


def print_track(track)
    puts('Track title is: ' + track.title)
  puts('Track file location is: ' + track.file_location)
end

def search_for_track_name(tracks, search_string)
found_index = -1
i = 0
  while (i < tracks.length)
      if (tracks[i].name.chomp == search_string.chomp)
        found_index = i
      end
      i += 1
    end
  return found_index
end


def print_album album
  puts 'Title is ' + album.title.to_s
  puts 'Artist is ' + album.artist.to_s
  puts 'Genre is ' + $genre_names[album.genre]
  print_tracks(album.tracks)
end

def main()
    music_file = File.new("album.txt", "r")
    tracks = read_tracks(music_file)
    music_file.close()

    search_string = read_string("Enter the track name you wish to find: ")
    index = search_for_track_name(tracks, search_string)
    if index > -1
      puts "Found " + tracks[index].name + " at " + index.to_s()
    else
      puts "Entry not Found"
    end
end

main()