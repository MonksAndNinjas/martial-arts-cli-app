
class MartialArts::Styles
  attr_reader :style
  @@all = []

  def initialize(style, country = nil)
    @style = style
    @country = country
  end

  def self.todays_list
    MartialArts::Scraper.scrape_popular
  end

  def self.all
    @@all
  end

  def self.styles_list
    #displays list of all styles
    sorted_styles = self.all.sort {|a,b| a.style <=> b.style }
    sorted_styles.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance.style}"
    end

    puts  "Enter the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back or list"
  end

  def self.valid?(style)
    #checks for duplicates
    self.all.detect do |style_instance|
      style_instance.style == style
    end
  end

  def import_styles
    styles_data = MartialArts::Scraper.all
    
  end

end
