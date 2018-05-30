
class MartialArts::Styles
  attr_reader :style, :country, :fighting_focus, :website, :description
  @@all = []
  @@popular = []

  def initialize(style, country, fighting_focus, website, description)
    @style = style
    @country = MartialArts::Countries.new(country)  #need to have a way of handling
    @fighting_focus = MartialArts::FightingFocus.new(fighting_focus)
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
    self.all.sort {|a,b| a.style <=> b.style }
  end

  def self.search_by_country(country)
    self.all.find_all {|style_instance| style_instance.country.name.strip.include? "#{country}" }
  end

  def self.search_by_focus(focus)
    self.all.find_all {|style_instance| style_instance.fighting_focus.name.strip.include? "#{focus}" }
  end

end
