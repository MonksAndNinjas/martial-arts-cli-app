
class MartialArts::Styles
  attr_reader :style, :country, :fighting_focus, :website, :description
  @@all = []

  def initialize(style, country, fighting_focus, website, description)
    @style = style
    @country = country
    @fighting_focus = fighting_focus
    @website = website
    @description = description
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

  def self.import_styles
    MartialArts::Scraper.all.each do |data_string|
      data_array = data_string.split(" - ")
      style = data_array[0]
      country = data_array[1]
      fighting_focus = data_array[2]
      website = data_array[3]
      description = data_array[4]
      #style_instance = MartialArts::Styles.new()
    end

  end

end
