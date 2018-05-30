
class MartialArts::Styles
  attr_accessor :country, :fighting_focus
  attr_reader :name, :website, :description
  @@all = []
  @@popular = []

  def initialize(style, country, fighting_focus, website, description)
    @name = style
    @country = MartialArts::Countries.new(country)
    @fighting_focus = MartialArts::FightingFocus.new(fighting_focus)
    @website = website
    @description = description

    @country.add_style(self)
    @fighting_focus.add_style(self)
  end

  

  def fighting_focus_name
    self.fighting_focus.name
  end

  def self.all
    @@all
  end

  def self.popular
    #top 10 list taken from simpatong website; up-to-date, but list is not dynamic
    @@popular
  end

  def self.styles_list
    self.all.sort {|a,b| a.style <=> b.style }
  end

  def self.search_by_country(country)
    self.all.find_all {|style_instance| style_instance.country.name.strip.include? "#{country}" }
  end

  def self.search_by_focus(focus)
    self.all.find_all {|style_instance| style_instance.fighting_focus_name.strip.include? "#{focus}" }
  end

end
