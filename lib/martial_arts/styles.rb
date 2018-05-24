
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
      if self.valid?(style.css('a')[0].text) == nil
        self.all << MartialArts::Styles.new(style.css('a')[0].text)  #saves instance
      end
    end
  end

  def self.todays_list
    self.scrape_popular
  end

  def self.all
    @@all
  end

  def self.styles_list
    #displays list of all styles
    sorted_styles = self.all.sort {|a,b| a.name <=> b.name }
    sorted_styles.each.with_index(1) do |style, i|
      puts "#{i}. #{style.name}"
    end

    puts  "Enter the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back or list"
  end

  def self.valid?(style)
    #checks for duplicates
    self.all.detect do |style_instance|
      style_instance.name == style
    end
  end

end
