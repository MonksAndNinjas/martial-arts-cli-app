
class MartialArts::Scraper
  @@all = []

  def self.scrape_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}
  end

  def self.scrape_styles
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    styles = doc.css('.div-col.columns.column-width').css('li').each do |style|
      if MartialArts::Styles.valid?(style.css('a')[0].text) == nil
        #saves instance
        MartialArts::Styles.all << MartialArts::Styles.new(style.css('a')[0].text)
      end
    end
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))

    countries = doc.css('.div-col.columns.column-width').each_with_index.each do |info, i|
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

  def self.scrape_data
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width').css('li').each do |style|
        html = Nokogiri::HTML(open("https://en.wikipedia.org#{style.css('a')[0]['href']}"))
        if html.css('table.infobox tr') != nil
          html.css('table.infobox tr').each do |info|
            if info.css('th').text == "Focus"
              @focus = info.css('td a').text
            elsif info.css('th').text == "Country of origin"
              @country = info.css('td a').text
            end
          end
        end
        @website = "https://en.wikipedia.org#{style.css('a')[0]['href']}"
        if html.css('div.mw-parser-output p')[0].text.size > 30
          @description = html.css('div.mw-parser-output p')[0].text
        else
          @description = html.css('div.mw-parser-output p')[1].text
        end
        self.all << "#{@country} - #{@focus} - #{@website} - #{@description}"
    end
    binding.pry
  end

  def self.all
    @@all
  end



end
