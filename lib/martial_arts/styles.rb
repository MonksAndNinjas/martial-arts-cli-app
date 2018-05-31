
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

  def country_name
    self.country.name
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
    self.all.sort {|a,b| a.name <=> b.name }
  end

  def self.search_by_country(country) #need to setup so that cli is getting from country_instance.styles
    self.styles_list.find_all {|style_instance| style_instance.country_name.strip.include? "#{country}" }
  end

  def self.search_by_focus(focus) #need to setup so that cli is getting from fighting_focus_instance.styles
    self.styles_list.find_all {|style_instance| style_instance.fighting_focus_name.strip.include? "#{focus}" }
  end

end
