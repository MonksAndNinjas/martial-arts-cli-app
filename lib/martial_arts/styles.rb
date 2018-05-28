
class MartialArts::Styles
  attr_reader :style, :country, :fighting_focus, :website, :description
  @@all = []
  @@popular = []

  def initialize(style, country, fighting_focus, website, description)
    @style = style.strip
    @country = MartialArts::Countries.new(country.strip)  #need to have a way of handling
    @fighting_focus = MartialArts::FightingFocus.new(fighting_focus.strip)
    @website = website
    @description = description
  end

  def self.all
    @@all
  end

  def self.popular
    @@popular
  end

  def self.styles_list
    #displays list of all styles
    sorted_styles = @@all.sort {|a,b| a.style <=> b.style }
    sorted_styles.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance.style}" if style_instance.style != nil
    end
    #binding.pry
    puts  "Enter the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back or list"
  end

  def self.valid?(style)
    #checks for duplicates
    self.all.detect do |style_instance|
      style_instance.style == style
    end
  end

end
