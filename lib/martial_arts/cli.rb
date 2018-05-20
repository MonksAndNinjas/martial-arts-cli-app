# Our CLI Controler
class MartialArts::CLI

  def call
    puts "OOOOOOSSSsss"
    #maybe want to add delay from first puts to second, maybe 3 seconds.
    puts "Choose your destiny"

    puts "1. Popular Martial Arts"
    puts "2. Martail Arts by Country"
    puts "3. Martial Art Styles"
    puts "4. Martial Art by Fighting-Focus"
    puts "5. quit"
    puts "Please enter the corresponding number" #should I give example of what to type

    menu
  end

  def menu
      input = nil
    while input != 5
      input = gets.chomp.to_i
      case input
      when 1
        puts "martial arts method"
      when 2
        puts "Select amongst the listed countries method"
      when 3
        puts "List of all styles available method"
      when 4
        puts "List of martial arts by fighting-focus method"
      else
        puts "I'm confused, can you try that again?"
      end
    end
  end

end
