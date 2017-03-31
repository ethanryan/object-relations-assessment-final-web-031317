class Viewer
  attr_accessor :first_name, :last_name

  ALL = []
  #binding.pry

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    #@full_name = first_name + last_name

    #@name = name #this is what we were given
    #@name = first_name + last_name
    ALL << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    ALL
  end

  def self.find_by_name(full_name)
    #binding.pry
    ALL.find do |viewer_name|
      full_name == viewer_name
    end #end loop
  end

  def create_rating
    self.rating
  end

end #end class

#bob = Viewer.new("bob smith")
bob = Viewer.new("bob", "smith")
bob.full_name

# Build the following methods on the viewer class
# + Viewer.all
#   + should return all of the viewers
# + Viewer.find_by_name(name)
#   + given a string of a full name,
#   returns the first customer whose full name matches
# + Viewer#create_rating
#   + given a score and a movie, creates a new Rating
#   and associates it with that viewer and that movie
