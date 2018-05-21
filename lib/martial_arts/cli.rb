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
        martial_arts_by_country
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
    #can't exit program when user is in this method so won't give exit as an option for now
    input = nil
    while input != "back"
      input = gets.strip.downcase

      case input
      when "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"
        style = MartialArts::Styles.todays_list[input.to_i - 1]

        puts "style.name"
        puts "style.country"
        puts "style.fighting_focus"
        puts "style.description"

      when "back"
        break    #don't want user to have to type exit multiple times to exit app, thus nil and not method.
      else
        puts "I'm confused, can you try that again"
      end
    end
  end

  def martial_arts_by_country
    #goes into the Country class to retrieve array of all countries
    #puts a list of countries without repetitions
    #learn more information about the styles.
    #user can then go back
  end

end
