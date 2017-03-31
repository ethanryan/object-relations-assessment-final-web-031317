class Rating
  attr_accessor :score, :viewer, :movie

  ALL = []

  def initialize(score, viewer, movie)
    @score = score
    @viewer = viewer
    @movie = movie
    ALL << self
  end

  def self.all
    ALL
  end

  def viewer(self)
    self.viewer
  end

  def movie(self)
    self.rating
  end


end


# Build out the following methods on the Rating class
#
# + Rating.all
#   + returns all of the ratings
# + Rating#viewer
#   + returns the viewer for that given rating
# + Rating#movie
#   + returns the movie for that given rating
