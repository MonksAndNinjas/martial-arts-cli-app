
class MartialArts::Styles
  #start here
  def self.todays_list
    self.scrape_popular
  end

  def self.scrape_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}
  end

  def self.all
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
    #use array @@all
  end

end
