# Our CLI Controler
class MartialArts::CLI

  def call
    puts "OOOOOOSSSsss"
    #maybe want to add delay from first puts to second, maybe 3 seconds.
    puts "Choose your destiny"
    #lists menu such as popular martial arts, martial arts by country, focus, and style
    menu
  end

  def menu
    puts "1. Top 10 martial arts type"
    puts "2. Martail Arts by Country"
    puts "3. Martial Art Styles"
    puts "4. Martial Art by Fighting-Focus"
    puts "5. quit"
  end

end
