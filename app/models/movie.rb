#ruby tools/console.rb

class Movie

  attr_accessor :title

  ALL = []

  def initialize(title)
    self.title = title
    ALL << self
  end
  #blow = Movie.new("Blow") => #<Movie:0x007fdf4e911290 @title="Blow">


  # + Movie.all
  #   + returns an array of all movies
  # + Movie.find_by_title(title)
  def self.all
    ALL
  end
  #Movie.all => [#<Movie:0x007fdf4e911290 @title="Blow">]


  # + Movie.find_by_title(title)
  #   + given a string of movie title, returns the first movie
  #   that matches
  def self.find_by_title(title)
    self.all.find do |movie_instance|
      movie_instance.title == title
    end #end loop
  end #end method
  #Movie.find_by_title("Blow") => #<Movie:0x007fa622a45a40 @title="Blow">


def ratings #no paramater here... map, not find_all
  Rating.all.map do |rating_instance| #Rating class, movie method, map...
    if rating_instance.movie == self.title #this needs to be self.title
      rating_instance.score #return all scores associated with self.title in an array
      #binding.pry
    end #end if statement
  end #end loop
end #end method
#blow = Movie.new("Blow")
#Rating.new("Blow", 5, "bob")
#Rating.new("Blow", 6, "susan")
#blow.ratings ##### this will open pry above...
#blow.ratings => [5, 6]


  # + Movie#viewers
  #   + should return all of the viewers who have left ratings
  #   for that movie.
  def viewers
    Rating.all.map do |rating_instance| #Rating class, movie method, map...
      if rating_instance.movie == self.title #this needs to be self.title
        rating_instance.viewer #return all scores associated with self.title in an array
      end #end if statement
    end #end loop
  end #end method
  #blow = Movie.new("Blow")
  #Rating.new("Blow", 5, "bob")
  #Rating.new("Blow", 6, "susan")
  #blow.viewers => ["bob", "susan"]


  # + Movie#average_rating
  #   + should return the average of all of the scores
  #   for the ratings of that particular movie.
  # arr = [5, 6, 7, 8]
  # arr.inject(0.0) { |sum, el| sum + el } / arr.size
  # => 6.5
  def average_rating
    #self.ratings calls the ratings method above on whatever movie instance 'self' is...
    array_of_scores = self.ratings
    array_of_scores.inject(0.0) {|sum, element| sum + element} / array_of_scores.size
  end
  #blow = Movie.new("Blow")
  #Rating.new("Blow", 5, "bob")
  #Rating.new("Blow", 6, "susan")
  #blow.average_rating => 5.5

end #end class
