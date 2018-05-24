
class MartialArts::Scraper

  def self.scrape_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}
  end

  def self.scrape_styles
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width').css('li').each do |style|
      if MartialArts::Styles.valid?(style.css('a')[0].text) == nil
        #saves instance
        MartialArts::Styles.all << MartialArts::Styles.new(style.css('a')[0].text)
      end
    end
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))

    doc.css('.div-col.columns.column-width').each_with_index.each do |info, i|
      if [0,3,5].include?(i) == false         # information from those indices are not needed
        info.css('dt a').each do |country|  #All other countries
          #@country = country.text
          MartialArts::Countries.all << MartialArts::Countries.new(country.text)
        end
      elsif i == 0
        info.css('li').each do |country|  #Africa
          #@country = country.text
          MartialArts::Countries.all << MartialArts::Countries.new(country.text)
        end
      end
    end
  end

end
