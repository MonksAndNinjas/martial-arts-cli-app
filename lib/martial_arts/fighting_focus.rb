
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

  def styles
    @styles
  end

  def self.all
    @@all
  end

end
