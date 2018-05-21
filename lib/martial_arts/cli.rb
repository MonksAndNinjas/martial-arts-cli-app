# Our CLI Controler
class MartialArts::CLI

  def call
    puts "OOOOOOSSSsss"
    #maybe want to add delay from first puts to second, maybe 3 seconds.
    puts "Choose your destiny"

    menu
  end

  def menu
    input = nil

    while input != "exit"
      #navigation
      puts "1. Popular Martial Arts"
      puts "2. Martail Arts by Country"
      puts "3. Martial Art Styles"
      puts "4. Martial Art by Fighting-Focus"
      puts "Please enter the corresponding number or type exit"
      #gets user input
      input = gets.strip.downcase
      #waits for response and then returns request
      case input
      when "1"
        popular_martial_arts
      when "2"
        puts "Select amongst the listed countries method"
      when "3"
        puts "List of all styles available method"
      when "4"
        puts "List of martial arts by fighting-focus method"
      when "exit"
        puts "Goodbye"
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def popular_martial_arts
    #this outputs the 10 most popular martial arts in the world.
    #today's scraped data from martial arts scraper"
    pop_styles = ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
    #pop_styles is an array of instances such that data = [style_instance0, style_instance1....] for today
    pop_styles.each_with_index do |instance|
      puts instance
    end
  end

end
