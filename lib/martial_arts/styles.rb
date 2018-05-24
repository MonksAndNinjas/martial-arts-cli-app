
class MartialArts::Styles
  attr_accessor :name
  @@all = []

  def initialize(style)
    @name = style
  end

  def self.scrape_popular
    #popular martial arts 2018
    doc = Nokogiri::HTML(open("http://www.singpatong-sitnumnoi.com/10-most-popular-martial-arts/"))
    info = doc.css('strong').text.split(/No.\w*. | from /) #mixture of country and style
    styles = info.select.with_index {|_, style| style.odd?}
  end

  def self.scrape_styles
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_martial_arts"))
    doc.css('.div-col.columns.column-width').css('li').each do |style|
      valid?
      style_instance = MartialArts::Styles.new(style.css('a')[0].text)

    end
  end

  def self.todays_list
    self.scrape_popular
  end

  def self.all
    @@all
  end

  def self.styles_list
    self.all.each.with_index(1) do |style, i|
      puts "#{i}. #{style.name}"  #when setup change to style_instance.name
    end

    puts  "Enter the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back or list"
  end

  def valid?
  end

end
