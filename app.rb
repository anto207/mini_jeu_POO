require 'bundler'
Bundler.require
require_relative 'lib/player'

    puts "<<--  Welcome to Fight Night Round game!!  -->>"
    puts "Please, insert a name of player1"
        name1 = gets.chomp
    puts "Please, insert a name of player2"
        name2 = gets.chomp
        player1 = Player.new(name1)
        player2 = Player.new(name2)

puts "      -------------------------------- "
puts "      +- Get Ready to the Next Battle -+"
puts "      -------------------------------- "
puts "    >>>>> #{player1.name}__VS__#{player2.name} <<<<<<"
puts "       #{player1.show_state} #{player2.show_state}"
#binding.pry

while player1.life_points > 0 && player2.life_points > 0 || player2.life_points > 0
    puts "+++++  Passons à la phase d'attaque +++++"
      
            puts "#{player1.attacks(player2)}"
            puts "#{player1.show_state} #{player2.show_state}"
            play = gets.chomp
        
            puts "-----   Inverse attaque  -------"
            puts "#{player2.attacks(player1)}"
            puts "#{player1.show_state} #{player2.show_state}"
            play = gets.chomp    
end