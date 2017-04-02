# Please copy/paste all three classes into this file to submit your solution!

#ruby tools/console.rb

class Viewer
  attr_accessor :first_name, :last_name, :name #need :name here

  ALL = []

  def initialize(name)
    @name = name #this is what we were given
    # @first_name = first_name
    # @last_name = last_name
    ALL << self
  end
  #bob = Viewer.new("bob smith") => #<Viewer:0x007fdff91d6768 @name="bob smith">
  #susan = Viewer.new("susan") => #<Viewer:0x007f847920e388 @name="susan">


  def full_name
    first_name = self.name.split.first
    last_name = self.name.split.last
    "#{first_name} #{last_name}"
  end
  #bob.full_name => "bob smith"
  #susan.full_name => "susan susan" ###good enough?


  # + Viewer.all
  #   + should return all of the viewers
  # + Viewer.find_by_name(name)
  def self.all
    ALL
  end
  #Viewer.all => [#<Viewer:0x007f847920e388 @name="susan">,
  #<Viewer:0x007f8477911290 @name="bob smith">]


  # + Viewer.find_by_name(name)
  #   + given a string of a full name,
  #   returns the first customer whose full name matches
  def self.find_by_name(full_name)
    self.all.find do |viewer_name|
      viewer_name.name == full_name ##fix this line...
    end #end loop
  end
  #Viewer.find_by_name("bob smith") => #<Viewer:0x007fa57d1a39c8 @name="bob smith">
  #Viewer.find_by_name("susan") => #<Viewer:0x007fa57d16aa38 @name="susan">


  # + Viewer#create_rating
  #   + given a score and a movie, creates a new Rating
  #   and associates it with that viewer and that movie
  def create_rating(movie, score)
    Rating.new(movie, score, self)
  end
  #susan = Viewer.new("susan")
  #elf = Movie.new("Elf")
  #susan.create_rating(elf, 8) => #<Rating:0x007fb0110573c8
  #@movie=
  #<Movie:0x007fb01118f038 @title="Elf">,
  #@score=8,
  #@viewer=
  #<Viewer:0x007fb011085a20 @name="susan">>

end #end class




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

end #end class




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
