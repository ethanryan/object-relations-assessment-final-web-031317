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
