class Movie
  attr_accessor :title

  ALL = []

  def initialize(title)
    #binding.pry
    #self.title = title
    @title = title
    ALL << self
    binding.pry
  end

  def self.all
    ALL
  end

  def self.find_by_title(title)
    ALL.find do |movie_title|
      title == movie_title
    end #end loop
  end #end method

  def ratings
    self.rating.map do |review|
      review
    end
  end

  def viewers
    self.viewer.map do |viewer_name|
      viewer_name
    end
  end

  def average_rating
    self.ratings.mean
  end



end #end class

blow = Movie.new("blow")
blow.find_by_title

# Build out the following methods on the movie class
#
# + Movie.all
#   + returns an array of all movies
# + Movie.find_by_title(title)
#   + given a string of movie title, returns the first movie
#   that matches
# + Movie#ratings
#   + returns an array of all ratings for that movie
# + Movie#viewers
#   + should return all of the viewers who have left ratings
#   for that movie.
# + Movie#average_rating
#   + should return the average of all of the scores
#   for the ratings of that particular movie.
