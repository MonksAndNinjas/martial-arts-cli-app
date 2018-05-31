
class MartialArts::Scraper
  @@all = []

  def self.scrape_data
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width li').each do |style|

        html = Nokogiri::HTML(open("https://en.wikipedia.org#{style.css('a')[0]['href']}"))

        if html.css('table.infobox tr') != nil
          html.css('table.infobox tr').each do |info|

            if info.css('th').text == "Focus"
              @focus = info.css('td a').text
            elsif info.css('th').text == "Country of origin"
              @country = info.css('td').text
            end

          end
        end

        @style = "#{html.css('h1').text.downcase}".gsub(/(\s\Dmartial\sarts?\D)/, '') # removes generic words in style name
        @style = "#{@style}".split.map(&:capitalize).join(' ')                        #capitalizes first letter of each word

        @website = "https://en.wikipedia.org#{style.css('a')[0]['href']}"

        description_info = html.css('div.mw-parser-output p').detect {|p| p.text.size > 20 and p.text.include?("#{@style}") and p.text != nil }
        if description_info == nil
          @description = "N/A"
        else
         @description =  "#{description_info.text}".tr('(\D[1234567]\D)', '') #removes unwanted text
         @description =  "#{@description}".sub('listen', '')                  #removes first occurence of listen
        end

       @country = "N/A" if @country == ""
       @focus = "N/A" if @focus == ""

       self.all << "#{@style} - #{@country} - #{@focus} - #{@website} - #{@description}"
    end

    self.import_styles
    self.import_popular
    self.country_groups
  end

  def self.import_styles
    self.all.each do |data_string|
      data_array = data_string.split(" - ")

      style = data_array[0]
      country = data_array[1]
      fighting_focus = data_array[2]
      website = data_array[3]
      description = data_array[4]

      MartialArts::Styles.all << MartialArts::Styles.new(style, country, fighting_focus, website, description)
    end
  end

  def self.import_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}

    styles.each do |style|
      style_instance = MartialArts::Styles.all.find {|style_instance| style_instance.name.downcase == style.downcase }

      MartialArts::Styles.popular << style_instance if style_instance
      MartialArts::Styles.popular << "Chinese Martial Arts" if style == "Kung fu"
      #Kung Fu encompasses many of the chinese martial arts
    end
  end

  def self.country_groups
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width').each_with_index do |info, i|

      if i == 0
        info.css('li').each {|country| MartialArts::Countries.filtered << country.css('a')[1].text }
      else
        info.css('dt a').each {|country| MartialArts::Countries.filtered << country.text }
      end

    end
  end

  def self.all
    @@all
  end


end
