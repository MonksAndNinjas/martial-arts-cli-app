
class MartialArts::FightingFocus
  attr_reader :name
  @@all = []

  def initialize(fighting_focus)
    @name = fighting_focus
    @styles = []
  end

  def add_style(style)
    @styles << style
    style.fighting_focus = self
  end

  #def styles
  #  @styles                styles method not needed, but fulfills fighting_focus has many styles relationship
  #end

  def self.all
    #contains fighting_focus in it's raw form; may contain 1, 2, or even 3 types of fighting_focus
    @@all
  end

end
