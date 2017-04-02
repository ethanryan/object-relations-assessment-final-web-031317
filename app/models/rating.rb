#ruby tools/console.rb

class Rating
  attr_accessor :movie, :score, :viewer #putting these alphabetically

  ALL = []

  def initialize(movie, score, viewer) #putting these alphabetically
    @movie = movie
    @score = score
    @viewer = viewer
    ALL << self
  end
  #blow_review = Rating.new("Blow", 5, "bob")


  def self.all
    ALL
  end
  #Rating.all => [#<Rating:0x007fb2468273f0
  # @movie="Blow",
  # @score=5,
  # @viewer="bob">]
  #looks like attributes are listed alphabetically

  #blow_review.viewer => "bob"

  #blow_review.movie => "Blow"

end
