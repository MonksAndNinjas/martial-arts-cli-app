
class MartialArts::FightingFocus

  def self.fighting_method(input)
    if input == "1"
      striking
    elsif input == "2"
      grappling
    elsif input == "3"
      hybrid
    elsif input == "4"
      weaponry
    elsif input == "5"
      internal
    end
  end

  def scrape_fighting_focus
  end

  def self.striking
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

  def self.grappling
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

  def self.hybrid
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

  def self.weaponry
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

  def self.meditative
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

end
