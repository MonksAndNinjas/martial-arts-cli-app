# Our CLI Controler
class MartialArts::CLI

  def call
    messages("greeting")

    menu
  end

  def menu
    navigation = {
      1 => [ "Popular Martial Arts", method(:popular_martial_arts_submenu) ],
      2 => [ "Martial Arts by Country", method(:martial_arts_by_country_submenu) ],
      3 => [ "Martial Art Styles", method(:all_styles_submenu) ],
      4 => [ "Martial Art by Fighting-Focus", method(:fighting_focus_submenu) ]
    }

    input = nil

    while input != "exit"

      puts " "
      navigation.each {|number, submenu_array| puts "#{number}. #{submenu_array[0]}" }
      puts " "
      puts "Please enter the corresponding number or type exit"

      input = gets.strip.downcase

      case input
      when "1", "2", "3", "4"
        navigation[input.to_i][1].()

      when "exit"
        messages("goodbye")
      else
        messages("invalid")
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
          MartialArts::Styles.search_by_country("China").each.with_index(1) do |style_instance, i|
            puts "#{i}. #{style_instance.style}"
          end

          messages("user")
        else
          display_info_for(style)
        end

      when "list"
        puts " "
        popular_list
      when "back"
        break
      else
        messages("invalid")
      end

    end
  end

  def popular_list
    MartialArts::Styles.popular.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance.style}" if style_instance.class == MartialArts::Styles
      puts "#{i}. #{style_instance}" if style_instance.class == String
    end

    messages("user")
  end

  def martial_arts_by_country_submenu
    MartialArts::Countries.country_list.each.with_index(1) {|country, i| puts "#{i}. #{country}"}

    messages("user")

    size = MartialArts::Countries.country_list.size
    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/

        if (1...size+1).include?(input.to_i)
          styles_by_country_list(input)
          country_styles_list_sub_submenu
        else
          messages("invalid")
        end

      when "list"
        MartialArts::Countries.country_list.each.with_index(1) {|country, i| puts "#{i}. #{country}"}

        messages("user")
      when "back"
        break
      else
        messages("invalid")
      end

    end
  end

  def country_styles_list_sub_submenu
    size = @style_list.size
    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/

        if (1...size+1).include?(input.to_i)

          display_info_for(@style_list[input.to_i-1])
        else
          messages("invalid")
        end

      when "list"
          styles_by_country_list(@country_input)
      when "back"
        MartialArts::Countries.country_list.each.with_index(1) {|country, i| puts "#{i}. #{country}"}

        messages("user")
        break
      else
        messages("invalid")
      end

    end
  end

  def styles_by_country_list(input)
    @country_input = input
    #move this to country class when ready
    country = MartialArts::Countries.country_list[input.to_i-1]
    puts "Martial Art styles from #{country}"  #list styles from country

    @style_list = MartialArts::Styles.search_by_country(country)
    @style_list.each.with_index(1) {|style_instance, i| puts "#{i}. #{style_instance.style}"}

    messages("user")
  end

  def all_styles_submenu
    MartialArts::Styles.styles_list.each.with_index(1) do |style_instance, i|
      puts "#{i}. #{style_instance.style}" if style_instance.style != nil
    end

    messages("user")

    size = MartialArts::Styles.all.size
    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/ #Checks if string is a number

        if (1...size+1).include?(input.to_i)
          style = MartialArts::Styles.styles_list[input.to_i-1]

          display_info_for(style)
          messages("user")
        else
          messages("invalid")
        end

      when "list"
        MartialArts::Styles.styles_list.each.with_index(1) do |style_instance, i|
          puts "#{i}. #{style_instance.style}" if style_instance.style != nil
        end

        messages("user")
      when "back"
        break
      else
        messages("invalid")
      end

    end
  end

  def fighting_focus_submenu
    fighting_focus_list

    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when "1", "2", "3", "4", "5"
        styles_by_focus_list(input)
        focus_styles_list_sub_submenu

      when "list"
        fighting_focus_list
      when "back"
        break
      else
        messages("invalid")
      end

    end
  end

  def focus_styles_sub_submenu
    size = @focus_style_list.size
    input = nil

    while input != "back"
      input = gets.strip.downcase

      case input
      when /\d\d*/

        if (1...size+1).include?(input.to_i)
          display_info_for(@focus_style_list[input.to_i-1])
        else
          messages("invalid")
        end

      when "list"
        styles_by_focus_list(@focus_input)
      when "back"
        fighting_focus_list
        break
      else
        messages("invalid")
      end

    end
  end

  def fighting_focus_list
    @focus_list = {1 => "Striking", 2 => "Grappling", 3 => "Weaponry", 4 => "Hybrid", 5 => "Internal"}
    @focus_list.each {|number, focus| puts "#{number}. #{focus}" }

    messages("user")
  end

  def styles_by_focus_list(input)
    @focus_input = input  #save input from focus_submenu so user can return

    @focus_style_list = MartialArts::Styles.search_by_focus(@focus_list[input.to_i])
    @focus_style_list.each.with_index(1) {|style_instance, i| puts "#{i}. #{style_instance.style}" }

    messages("user")
  end

  def messages(type)
    if type == "gretting"

      puts "OOOOOOSSSsss"
      puts "Choose your destiny"
      #maybe want to add delay from first puts to second, maybe 3 seconds.
    elsif type == "invalid"

      puts "I'm confused can you try that again?"

    elsif type == "user"

      puts " "
      puts "Enter the corresponding number for more information"
      puts "Otherwise type back or list"

    elsif type == "goodbye"

      puts "Goodbye"

    end
  end

  def display_info_for(style)

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

  end

end
