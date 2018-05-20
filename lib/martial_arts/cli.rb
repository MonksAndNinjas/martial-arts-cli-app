# Our CLI Controler
class MartialArts::CLI

  def call
    puts "OOOOOOSSSsss"
    #maybe want to add delay from first puts to second, maybe 3 seconds.
    puts "Choose your destiny"
    #lists menu such as popular martial arts, martial arts by country, focus, and style
    menu
    #gets input from user
    input = gets.chomp.to_i

    return_request(input)
    until input < 6 and input > 0
      return_request(gets.chomp.to_i)
    end
    #double check until loop when have created methods for menu options
  end

  def menu
    puts "1. Popular Martial Arts"
    puts "2. Martail Arts by Country"
    puts "3. Martial Art Styles"
    puts "4. Martial Art by Fighting-Focus"
    puts "5. quit"
    puts "Please enter the corresponding number" #should I give example of what to type
  end

  def return_request(input)
    if input == 1
      popular_martial_arts
    elsif input == 2
      martial_art_by_country
    elsif input == 3
      martial_art_styles
    elsif input == 4
      martial_art_by_focus
    elsif input == 5
      quit
    else
      puts "invalid entry"
    end
  end


end
