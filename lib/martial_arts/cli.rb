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
      puts " "
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
        style = MartialArts::Styles.popular[input.to_i - 1]
        if style == "Chinese Martial Arts"
          style = MartialArts::Styles.all.find {|style_instance| style_instance.country.name == "China"}
        end
        puts " "
        puts "Style: #{style.style}"
        puts " "
        puts "Country: #{style.country.name}"
        puts "Fighting Focus: #{style.fighting_focus.name}"
        puts " "
        puts "Description: #{style.description}"
        puts " "
        puts "More Info: #{style.website}"
        puts " "

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

  def popular_list
    puts " "
    MartialArts::Styles.popular.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance.style}" if style_instance.class == MartialArts::Styles
      puts "#{i}. #{style_instance}" if style_instance.class == String
    end

    puts  " "
    puts  "Enter the corresponding number for more information about the style"
    puts  "Otherwise, type back or list"
  end

  def martial_arts_by_country_submenu
    MartialArts::Countries.country_list
    size = MartialArts::Countries.all.size
    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/                             #Checks if string is a number
        if (1...size+1).include?(input.to_i)   #makes sure number is within range.
          styles_by_country_list(input)
          country_styles_list
        else
          puts "I'm confused, can you try that again?"
        end
      when "list"
        MartialArts::Countries.country_list
      when "back"
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def styles_by_country_list(input)
    @country_input = input
    #move this to country class when ready
    sorted_list = MartialArts::Countries.group.sort {|a,b| a <=> b }
    puts "Martial Art styles from #{sorted_list[input.to_i-1]}"  #list styles from country

    style_list = MartialArts::Styles.all.find_all {|style_instance| style_instance.country.name == sorted_list[input.to_i-1] }
    style_list.each_with_index {|style_instance, i| puts "#{i+=1}. #{style_instance.style}"}

    puts "Enter the corresponding number for more information about the style"
    puts "Otherwise type back or list"
  end

  def country_styles_list
    styles = ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
    size = styles.size

    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/                            #Checks if string is a number
        if (1...size+1).include?(input.to_i)  #makes sure number is within range.
          style = styles[input.to_i - 1]

          puts "style.name"
          puts "style.country"
          puts "style.fighting_focus"
          puts "style.description"

          puts "Type list, or back"
        else
          puts "I'm confused, can you try that again?"
        end
      when "list"
          styles_by_country_list(@country_input)
      when "back"
          MartialArts::Countries.country_list
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def all_styles_submenu
    MartialArts::Styles.styles_list
    size = MartialArts::Styles.all.size

    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/ #Checks if string is a number
        if (1...size+1).include?(input.to_i)
          style = MartialArts::Styles.all.sort {|a,b| a.style <=> b.style }[input.to_i-1]
          puts "Style: #{style.style}"
          puts " "
          puts "Country: #{style.country.name}"
          puts "Fighting Focus: #{style.fighting_focus.name}"
          puts " "
          puts "Description: #{style.description}"
          puts " "
          puts "More Info: #{style.website}"
          puts " "

          puts "Type list, or back"
        else
          puts "I'm confused, can you try that again?"
        end
      when "list"
        MartialArts::Styles.styles_list
      when "back"
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

  def fighting_focus_submenu
    fighting_methods_list

    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when "1", "2", "3", "4", "5"
        styles_by_focus_list(input)
        focus_styles_list
      when "list"
        fighting_methods_list
      when "back"
        break
      else
        puts "I'm confused, can you type that again?"
      end
    end
  end

  def fighting_methods_list
    puts "1. Striking"
    puts "2. Grappling"
    puts "3. Weaponry"
    puts "4. Hybrid"
    puts "5. Meditative"
    puts "Enter the corresponding number for styles"
    puts "Otherwise, type back"
  end

  def styles_by_focus_list(input)
    @focus_input = input  #to save original input
    MartialArts::FightingFocus.fighting_methods(input).each.with_index(1) do |fighting_focus, i|
      puts "#{i}. #{fighting_focus}"
    end

    puts "Enter the corresponding number for more information about the style"
    puts "Otherwise type back, or list"
  end

  def focus_styles_list
    styles = ["style0", "style1", "style2", "style3", "styel4", "style5", "style6", "style7", "style8", "style9"]
    size = styles.size

    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/ #Checks if string is a number
        if (1...size+1).include?(input.to_i) #makes sure number is within range.
          style = styles[input.to_i - 1]

          puts "style.name"
          puts "style.country"
          puts "style.fighting_focus"
          puts "style.description"
          puts "Type list, or back"
        else
          puts "I'm confused, can you try that again?"
        end
      when "list"
        styles_by_focus_list(@focus_input)
      when "back"
        fighting_methods_list
        break
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

end
