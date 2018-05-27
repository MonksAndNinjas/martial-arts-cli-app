
class MartialArts::Scraper
  @@all = []

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
        @style = html.css('h1').text
        @website = "https://en.wikipedia.org#{style.css('a')[0]['href']}"
        if html.css('div.mw-parser-output p')[0].text.size > 20
          @description = html.css('div.mw-parser-output p')[0].text
        else
          @description = html.css('div.mw-parser-output p')[1].text
        end
        @country = "N/A" if @country == ""
        @focus = "N/A" if @focus == ""

        self.all << "#{@style} - #{@country} - #{@focus} - #{@website} - #{@description}"
    end

    self.import_styles
    self.import_popular
  end

  def self.import_styles
    self.all.each do |data_string|
      data_array = data_string.split(" - ")
      style = data_array[0]
      country = data_array[1]
      fighting_focus = data_array[2]
      website = data_array[3]
      description = data_array[4]
      style_instance = MartialArts::Styles.new(style, country, fighting_focus, website, description)
      MartialArts::Styles.all << style_instance
    end
  end

  def self.import_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}
    styles.each do |style|
      style_instance = MartialArts::Styles.all.find {|style_instance| style_instance.style == style }
      MartialArts::Styles.popular << style_instance
    end
  end

  def self.all
    @@all
  end


end
