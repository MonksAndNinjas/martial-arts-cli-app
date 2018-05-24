
class MartialArts::FightingFocus

  def self.scrape_fighting_focus
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    style_webpages = doc.css('.div-col.columns.column-width').css('li').collect do |style|
                       "https://en.wikipedia.org" + style.css('a')[0]['href']
                     end                                    #retrieves info on style
  end

  def self.fighting_method(input)
    if input == "1"
      striking        #don't have self.striking yet it still works, learn more.
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
