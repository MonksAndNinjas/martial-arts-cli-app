
class MartialArts::Scraper
  @@all = []

  def self.scrape_data
    #4 steps
    #1 retrieve all style information from their individual wikipedia websites
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width li').each do |style|

      html = Nokogiri::HTML(open("https://en.wikipedia.org#{style.css('a')[0]['href']}"))

      if html.css('table.infobox tr') != nil
        html.css('table.infobox tr').each do |info|

          #retrieves focus and country data
          if info.css('th').text == "Focus"
            @focus = info.css('td a').text
          elsif info.css('th').text == "Country of origin"
            @country = info.css('td').text
          end

        end
      end

      #retrieves style data
      style_edit = "#{html.css('h1').text.downcase}".gsub(/(\s\Dmartial\sarts?\D)/, '') # removes generic words in style name
      @style = "#{style_edit}".split.map(&:capitalize).join(' ')                        #capitalizes first letter of each word

      #retrieves website data
      @website = "https://en.wikipedia.org#{style.css('a')[0]['href']}"

      #retrieves description data
      description_info = html.css('div.mw-parser-output p').detect do |p|
        p.text.size > 20 and p.text.include?("#{@style}") and p.text != nil
      end

      if description_info == nil
        @description = "N/A"
      else
       description_edit =  "#{description_info.text}".tr('(\D[1234567]\D)', '') #removes unwanted text
       @description =  "#{description_edit}".sub('listen', '')                  #removes first occurence of listen
      end

     #checks for empty data that is converted to N/A
     @country = "N/A" if @country == ""
     @focus = "N/A" if @focus == ""

     #puts it all together into one string of data
     self.all << "#{@style} - #{@country} - #{@focus} - #{@website} - #{@description}"
    end

    #2 instantiates the informaiton
    self.import_countries
    #3 retrieves popular martial arts from a website
    self.import_popular
    #4 retrieves easier to acces country list
    self.import_styles
  end

  def self.import_styles
    self.all.each do |data_string|
      data_array = data_string.split(" - ")

      style = data_array[0]
      #checks for duplicates styles; does not create style instance, but is kept in its raw form
      if MartialArts::Styles.all.detect {|style_instance| style_instance.name == style}  == nil
        country = data_array[1]
        fighting_focus = data_array[2]

        if style == "Karate In The United States"
          style = "American Karate"
          country = "United States"
          fighting_focus = "Hybrid"
        end

        website = data_array[3]
        description = data_array[4]

        MartialArts::Styles.all << MartialArts::Styles.new(style, country, fighting_focus, website, description)

      end
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

  def self.import_countries
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
