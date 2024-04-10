require "./input_functions"
# put your code below

class Track
    attr_accessor :name, :location
    def initialize(name, location)
    @name = name
    @location = location
    end
end

def read_track()
    track_name = read_string("Enter track name: ")
    location_name = read_string("Enter track location: ")
    return Track.new(track_name, location_name)
end

def print_track(track)
    puts("Track name:" + track.name)
    puts("Track location: " + track.location)
end

def main()
    track = read_track()
    print_track(track)
end

# leave this line
main() if __FILE__ == $0