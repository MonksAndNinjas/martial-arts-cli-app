
class MartialArts::Styles
  @@all = []

  def self.scrape_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}
  end

  def self.scrape_styles
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width').css('li').each do |style|
      self.all << style.css('a')[0].text if @@all.include?(style.css('a')[0].text) == false
    end
  end

  def self.todays_list
    self.scrape_popular
  end

  def self.all
    @@all
  end

  def self.styles_list
    self.all.sort.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance}"  #when setup change to style_instance.name
    end

    puts  "Enter the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back or list"
  end

end
