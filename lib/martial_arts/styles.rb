
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

  def self.scrape_styles
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    styles = doc.css('.div-col.columns.column-width').css('li').collect do |style|
      style.css('a')[0].text
    end
  end

  def self.all
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
    #use array @@all
  end

end
