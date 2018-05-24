
class MartialArts::Countries
  attr_reader :country, :style
  @@all = []

  def initialize(country, style = nil)
    @country = country
    @style = style
  end

  def self.country_styles
    @all

    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

  def self.country_list
    sorted_countries = self.all.sort {|a,b| a.country <=> b.country }
    sorted_countries.uniq.each.with_index(1) {|country_instance, i| puts "#{i}. #{country_instance.country}"}
    puts "Enter the corresponding number to see all martial arts from that country"
    puts "Otherwise, type back or list"
    #check at some point for uniqueness
    #change country_instance when instance created
  end

  def self.all
    @@all
  end

  #def self.scrape_countries
  #  doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))

  #  countries = doc.css('.div-col.columns.column-width').each_with_index.each do |info, i|
  #    if [0,3,5].include?(i) == false         # information from those indices are not needed
  #      info.css('dt a').each do |country|  #All other countries
          #@country = country.text
  #        self.all << MartialArts::Countries.new(country.text)
  #      end
  #    elsif i == 0
  #      info.css('li').each do |country|  #Africa
  #        #@country = country.text
  #        self.all << MartialArts::Countries.new(country.text)
  #      end
  #    end
  #  end
  #end


end
