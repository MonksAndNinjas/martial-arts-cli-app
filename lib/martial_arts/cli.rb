require 'pry'

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
    MartialArts::Styles.todays_list.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance}"
    end

    puts  "Type the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back"

    input = nil
    while input != "back"
      styles = MartialArts::Styles.todays_list
      input = gets.strip.downcase

      case input
      when "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
        style = styles[input.to_i - 1]

        puts "style.name"
        puts "style.country"
        puts "style.fighting_focus"
        puts "style.description"

      when "back"
        nil           #don't want user to have to type exit multiple times to exit app, thus nil and not method.
      else
        puts "I'm confused, can you try that again"
      end
    end
  end

end
