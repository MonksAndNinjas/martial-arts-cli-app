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
    #checks for appropriate input then returns request
    return_request(input)
  end

  def menu
    puts "1. Top 10 martial arts"
    puts "2. Martail Arts by Country"
    puts "3. Martial Art Styles"
    puts "4. Martial Art by Fighting-Focus"
    puts "5. quit"
    puts "Please enter the corresponding number" #should I give example of what to type
  end

end
