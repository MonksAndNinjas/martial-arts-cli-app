
class MartialArts::FightingFocus
  attr_reader :name
  @@all = []

  def initialize(fighting_focus)
    @name = fighting_focus
    self.class.all << @name
  end

  def self.all
    @@all
  end

end
