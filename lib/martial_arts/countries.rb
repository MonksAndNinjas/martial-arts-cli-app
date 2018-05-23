
class MartialArts::Countries
  @@all = []

  def self.country_styles
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

  def self.country_list
    self.all.sort.each.with_index(1) {|country_instance, i| puts "#{i}. #{country_instance}"}
    puts "Enter the corresponding number to see all martial arts from that country"
    puts "Otherwise, type back or list"
    #check at some point for uniqueness
    #change country_instance when instance created
  end

  def self.all
    @@all
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    #africa = doc.css('.div-col.columns.column-width')[0].css('li')[0].css('a')[1]

    doc.css('.div-col.columns.column-width').each_with_index.each do |countries_string, i|
      if [0,3,5].include?(i) == false         # information from those indices are not needed
        countries_string.css('dt a').each do |country|
          self.all << country.text
        end
      elsif i == 0
        countries_string.css('li').each do |country|
          self.all << country.css('a')[1].text
        end
      end
    end
  end

end
