

# class Application
#   def perform
#      game = Game.new
#      show = Show.new
#      while game.status == "on going"
#        show.show_board(game.board)
#        game.turn
#      end
#      game.game_end
#   end
#  end

#instructions 
#puts "Chaque tour, rentrez vos coordonnées selon le tableau ci-dessous"
#puts "A 1 | B 1 | C 1"
#puts "A 2 | B 2 | C 2"
#puts "A 3 | B 3 | C 3"



def play_turn(current_player)
  puts "#{current_player.name}, entre une case :".colorize(:color => :yellow, :mode => :bold)
  input = gets.chomp.upcase

  if @board_cases.key?(input) && @board_cases[input].value == " "
    @board_cases[input].value = current_player.value
    @turns_played += 1
  else
    puts "Entrée invalide ou case déjà occupée... Veuillez entrer une case valide (par exemple, A1, B2, C3).".colorize(:color => :yellow, :mode => :bold)
    play_turn(current_player)
  end
end