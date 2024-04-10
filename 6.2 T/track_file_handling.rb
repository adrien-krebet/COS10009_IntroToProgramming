
class Track
  attr_accessor :name, :location

  def initialize (name, location)
    @name = name
    @location = location
  end
end

# Returns an array of tracks read from the given file
def read_tracks(music_file)
  count = music_file.gets().to_i()
  tracks = Array.new()
  while count > 0
    track = read_track(music_file)
    tracks << track
    count -= 1
    end
  return tracks
end

# reads in a single track from the given file.
def read_track(music_file)
  name = music_file.gets.chomp.to_s
  location = music_file.gets.chomp.to_s
  read_track_out = Track.new(name, location)
  return read_track_out
end


# Takes an array of tracks and prints them to the terminal
def print_tracks(tracks)
  i = 0
  while i < tracks.length
    print_track tracks[i]
    i += 1
  end
end

# Takes a single track and prints it to the terminal
def print_track(track)
  puts(track.name)
  puts(track.location)
end

# Open the file and read in the tracks then print them
def main()
  a_file = File.new("input.txt", "r") # open for reading
  tracks = read_tracks(a_file)
  # Print all the tracks
  print_tracks(tracks)
end

main()
