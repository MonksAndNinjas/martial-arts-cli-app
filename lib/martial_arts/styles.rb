
class MartialArts::Styles
  attr_reader :style, :country, :fighting_focus, :website, :description
  @@all = []
  @@popular = []

  def initialize(style, country, fighting_focus, website, description)
    @style = style
    @country = MartialArts::Countries.new(country)
    @fighting_focus = MartialArts::FightingFocus.new(fighting_focus)
    @website = website
    @description = description
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
    self.all.find_all {|style_instance| style_instance.fighting_focus.name.strip.include? "#{focus}" }
  end

end
