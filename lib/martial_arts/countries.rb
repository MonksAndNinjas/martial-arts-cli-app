
class MartialArts::Countries

  def self.country_styles
    ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
  end

  def self.all
    self.scrape_countries
  end

  def self.scrape_countries
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    africa = doc.css('.div-col.columns.column-width')[0].css('ul') #add [i].text
    americas = doc.css('.div-col.columns.column-width')[1].css('dt a') #add .text
    asia = doc.css('.div-col.columns.column-width')[2].css('dt a')  #add .text
    europe = doc.css('.div-col.columns.column-width')[4].css('dt a')  #add .text

    countries = doc.css('.div-col.columns.column-width').each_with_index.collect do |country, i|
                  country.css('dt a').text if [0,3,5].include?(i) == false
                end.compact



    binding.pry
    ["country0", "country1", "country2", "country3", "country4", "country5", "country6", "country7", "country8", "country9"]
  end

end
