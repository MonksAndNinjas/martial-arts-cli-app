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
        popular_martial_arts_submenu
      when "2"
        martial_arts_by_country_submenu
      when "3"
        all_styles_submenu
      when "4"
        fighting_focus_submenu
      when "exit"
        puts "Goodbye"
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def popular_martial_arts_submenu
    #this outputs the 10 most popular martial arts in the world.
    popular_list
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

        puts "Type list, or back"
      when "list"
        popular_list
      when "back"
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def martial_arts_by_country_submenu
    country_list
    size = MartialArts::Countries.all.size
    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/ #Checks if string is a number
        if (1...size+1).include?(input.to_i) #makes sure number is within range.
          styles_by_country_list(input)
          styles_list
        else
          puts "I'm confused, can you try that again?"
        end
      when "list"
        country_list
      when "back"
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def all_styles_submenu
    all_styles_list
    size = MartialArts::Styles.all.size

    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/ #Checks if string is a number
        if (1...size+1).include?(input.to_i)
          puts "style.name"
          puts "style.country"
          puts "style.fighting_focus"
          puts "style.description"

          puts "Type list, or back"
        else
          puts "I'm confused, can you try that again?"
        end
      when "list"
        all_styles_list
      when "back"
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def fighting_focus_submenu
    puts "1. Striking"
    puts "2. Grappling"
    puts "3. Weaponry"
    puts "4. Hybrid"
    puts "5. Meditative"
    puts "Enter the corresponding number for styles"
    puts "Otherwise, type back"

    input = nil

    while input != "back"
      input = gets.split.downcase

      case input
      when 
      end
    end
  end

  def popular_list
    MartialArts::Styles.todays_list.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance}" #when setup change to style_instance.name
    end

    puts  "Enter the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back or list"
  end

  def country_list
    #goes into the Country class to retrieve array of all countries
    MartialArts::Countries.all.each.with_index(1) do |country_instance, i|
      puts "#{i}. #{country_instance}" #When setup change to country_instance.name
    end                                #check at some point for uniqueness

    puts "Enter the corresponding number to see all martial arts from that country"
    puts "Otherwise, type back or list"
  end

  def styles_list
    styles_by_country = ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
    size = styles_by_country.size
    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/ #Checks if string is a number
        if (1...size+1).include?(input.to_i) #makes sure number is within range.
          style = styles_by_country[input.to_i - 1]

          puts "style.name"
          puts "style.country"
          puts "style.fighting_focus"
          puts "style.description"

          puts "Type list, or back"
        else
          puts "I'm confused, can you try that again?"
        end
      when "list"
        styles_by_country_list(input)
      when "back"
        country_list
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def styles_by_country_list(input)
    styles_by_country = ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
    #move this to country class when ready
    puts "Martial Art styles from #{MartialArts::Countries.all[input.to_i - 1]}"  #list styles form country

    styles_by_country.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance}" #When setup change to style_instance.name
    end

    puts "Enter the corresponding number for more information about the style"
    puts "Otherwise type back or list"
  end

  def all_styles_list
    MartialArts::Styles.all.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance}"  #when setup change to style_instance.name
    end

    puts  "Enter the corresponding number for more information on the style of martial art."
    puts  "Otherwise, type back or list"
  end

end
