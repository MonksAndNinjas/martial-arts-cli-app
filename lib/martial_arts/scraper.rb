
class MartialArts::Scraper
  @@all = []

  def self.scrape_data
    #4 steps
    #1 retrieve all style information from their individual wikipedia websites
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width li').each do |style|
      #opens the style's website
      html = Nokogiri::HTML(open("https://en.wikipedia.org#{style.css('a')[0]['href']}"))

      if html.css('table.infobox tr') != nil
        html.css('table.infobox tr').each do |info|

          #retrieves focus and country data
            @focus = info.css('td a').text if info.css('th').text == "Focus"
            @country = info.css('td').text if info.css('th').text == "Country of origin"

        end
      end

      #retrieves style data
      style_edit = "#{html.css('h1').text.downcase}".gsub(/(\s\Dmartial\sarts?\D)/, '') #removes generic words in style name
      @style = "#{style_edit}".split.map(&:capitalize).join(' ')                        #capitalizes first letter of each word

      #retrieves description data
      description_info = html.css('div.mw-parser-output p').detect do |p|
        p.text.size > 20 and p.text.include?("#{@style}") and p.text != nil
      end

      if description_info == nil
        @description = "N/A"
      else
       description_edit =  "#{description_info.text}".tr('(\D[123456789]\D)', '') #removes unwanted text
       @description =  "#{description_edit}".sub('listen', '')                  #removes first occurence of listen
      end

      #retrieves website data
      @website = "https://en.wikipedia.org#{style.css('a')[0]['href']}"

      #checks for empty data that is converted to N/A

      @country = "N/A" if @country == ""
      @focus = "N/A" if @focus == ""

      #puts it all together into one string of data
      self.all << "#{@style} - #{@country} - #{@focus} - #{@website} - #{@description}"
    end

    #2 instantiates the informaiton
    self.import_styles
    #3 retrieves popular martial arts from a website
    self.import_popular
    #4 retrieves easier to acces country list
    self.import_countries
  end

  def self.import_styles
    self.all.each do |data_string|
      data_array = data_string.split(" - ")

      @style = data_array[0]
      @country = data_array[1]
      @fighting_focus = data_array[2]
      @website = data_array[3]
      @description = data_array[4]

      if MartialArts::Styles.duplicates?(@style) == nil
        self.correct_errors(@style, @country, @fighting_focus, @website, @description)
        MartialArts::Styles.all << MartialArts::Styles.new(@style, @country, @fighting_focus, @website, @description)
      end

    end
  end

  def self.import_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}

    styles.each do |style|
      #assuming the style_instance will definitely be there for the most popular style name
      style_instance = MartialArts::Styles.all.find {|style_instance| style_instance.name.downcase == style.downcase }
      self.correct_errors(style_instance, style)
    end
  end

  def self.import_countries
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width').each_with_index do |info, i|

      info.css('li').each {|country| MartialArts::Countries.filtered << country.css('a')[1].text } if i == 0  #list for African countries
      info.css('dt a').each {|country| MartialArts::Countries.filtered << country.text } if i > 0             #rest of the countries

    end
  end

  def self.all
    @@all
  end

  def self.correct_errors(info_1, info_2 = nil, info_3 = nil, info_4 = nil, info_5 = nil)
    #enter code here for problems with style info
    if info_1 == "Karate In The United States"                                     #info_1 = style(String class) - from .import_syles
      @style = "American Karate"
      @country = "United States"
      @fighting_focus = "Hybrid"
    end

    MartialArts::Styles.popular << info_1 if info_1.class == MartialArts::Styles    #info_1 == style_instance - from .import_popular
    MartialArts::Styles.popular << "Chinese Martial Arts" if info_2 == "Kung fu"    #info_2 == style - from .import_popular
    #Kung Fu encompasses many of the chinese martial arts
  end

end
