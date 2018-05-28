
class MartialArts::Countries
  attr_reader :name
  @@all = []
  @@group = []

  def initialize(name)
    @name = name
    self.class.all << @name
  end

  def self.country_list     #pulling from the up to date list with corrections
    sorted_list = self.group.sort {|a,b| a <=> b }
    sorted_list.each.with_index(1) {|country, i| puts "#{i}. #{country}" }

    puts " "
    puts "Enter the corresponding number to see all martial arts from that country"
    puts "Otherwise, type back or list"
    #check at some point for uniqueness
  end

  def self.group
    @@group
  end

  def self.search
      #self.group.find_all do |country|
      #  if country.chomp == "UK" 
  end


  def self.all
    @@all
  end

end
