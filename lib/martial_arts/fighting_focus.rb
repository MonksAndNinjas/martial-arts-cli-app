
class MartialArts::FightingFocus
  attr_reader :name
  @@all = []

  def initialize(fighting_focus)
    @name = fighting_focus
    self.class.all << @name
  end

  def self.fighting_focus(input)
    list = MartialArts::Styles.all.collect do |instance|
      if instance.fighting_focus.name == "Striking" and input == "1"
        instance.style
      elsif instance.fighting_focus.name == "Grappling" and input == "2"
        instance.style
      elsif instance.fighting_focus.name == "Weaponry" and input == "3"
        instance.style
      elsif instance.fighting_focus.name == "Hybrid" and input == "4"
        instance.style
      elsif instance.fighting_focus.name == "Internal" and input == "5"
      instance.style
      end
    end

    list.compact.uniq.sort {|a,b| a <=> b }
  end

  def self.all
    @@all
  end

end
