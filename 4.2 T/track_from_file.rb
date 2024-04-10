# put your code here:

class Track
    attr_accessor :name, :location
    def initialize(name, location)
        @name = name
        @location = location
    end
end

def read_track(filename)
    a_file = File.new(filename, "r")
    track_name = a_file.gets()
    track_location = a_file.gets()
    a_file.close()
    return Track.new(track_name, track_location)
end

def print_track(track)
    puts("Track name: " + track.name)
    puts("Track location: " + track.location)
end

def main()
    filename = ("track.txt") 
    track = read_track(filename)
    print_track(track) 
end

main() if __FILE__ == $0 # leave this 