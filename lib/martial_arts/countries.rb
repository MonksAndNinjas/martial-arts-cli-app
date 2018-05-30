
class MartialArts::Countries
  attr_reader :name
  @@all = []
  @@group = []

  def initialize(name)
    @name = name
    self.class.all << @name
  end

  def self.country_list
    sorted_list = self.group.sort {|a,b| a <=> b }
  end

  def self.group
    @@group
  end

  def self.all
    @@all
  end

end
