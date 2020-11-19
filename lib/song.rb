require 'pry'
class Song
    attr_reader :name, :artist, :genre

    @@count = 0
    @@genres = []
    @@artists = []
    @@genre_count = {}
    @@artist_count = {}

    def initialize(title, artist, genre)
        @name = title
        @artist = artist
        @genre = genre
        @@count += 1
        @@genres << @genre
        @@artists << @artist
    end

    def self.count 
        @@count
    end
    
    def self.artist_count
        @@artists.each {|name|
            if @@artist_count[name]
                @@artist_count[name] += 1
            else 
                @@artist_count[name] = 1
            end
        }
        @@artist_count
    end

    def self.genre_count
        @@genres.each {|name|
            if @@genre_count[name]
                @@genre_count[name] += 1
            else 
                @@genre_count[name] = 1
            end
        }
        @@genre_count
    end

    def self.genres
        self.genre_count
        result = []
        @@genre_count.each{|name, count| result << name }
        result
    end
    
    def self.artists
        self.artist_count
        result = []
        @@artist_count.each{|name, count| result << name }
        result
    end
end