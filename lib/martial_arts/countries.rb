
class MartialArts::Countries
  attr_reader :name
  @@all = []

  def initialize(name)
    @name = name
    self.class.all << @name
  end

  def self.country_list
    sorted_list = self.all.sort {|a,b| a <=> b }
    sorted_list.each.with_index(1) {|country, i| puts "#{i}. #{country}"}

    puts "Enter the corresponding number to see all martial arts from that country"
    puts "Otherwise, type back or list"
    #check at some point for uniqueness
  end

  def self.all
    @@all
  end

end
