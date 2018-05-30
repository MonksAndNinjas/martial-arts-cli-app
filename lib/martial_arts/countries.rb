
class MartialArts::Countries
  attr_reader :name
  @@unfiltered = []
  @@filtered = []

  def initialize(name)
    @name = name
    self.class.all << @name
  end

  def self.country_list
    sorted_list = self.filtered.sort {|a,b| a <=> b }
  end

  def self.filtered
    #styles from the list of martial arts wikipedia page, easer to acces but not as much info
    @@group
  end

  def self.unfiltered
    #countries from the style's wikipedia page, has more info but harder to access if not specific
    @@all
  end

end
