
class MartialArts::Countries
  attr_reader :name
  @@unfiltered = []
  @@filtered = []

  def initialize(name)
    @name = name
    @styles = []
  end

  def add_style(style)
    @styles << style
    style.country = self
  end

  def self.country_list
    self.filtered.sort {|a,b| a <=> b }
  end

  def self.filtered
    #styles from the list of martial arts wikipedia page, easer to acces but not as much info
    @@filtered
  end

  def self.unfiltered
    #countries from the style's wikipedia page, has more info but harder to access if not specific
    @@unfiltered
  end

end
