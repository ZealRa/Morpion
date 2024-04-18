require 'bundler'
Bundler.require

class Game 
    attr_accessor :current_player, :status, :players, :board

    def initialize 
        puts "Bienvenue dans le jeu !"
        print "Joueur 1, veuillez entrer votre prénom : "
        player1_name = gets.chomp
        print "Joueur 2, veuillez entrer votre prénom : "
        player2_name = gets.chomp
        @players = [Player.new(player1_name, "X"), Player.new(player2_name, "O")]
        @current_player = @players.first
        @status = "ongoing"
        @board = Board.new
    end
  
    def play_turn
        turns_played = 0
        current_player = turns_played.even? ? "X" : "O"

        puts "#Joueur #{current_player}, c'est ton tour."
        puts "Saisis une case (e.g., A1, B2, C3):"
        position = gets.chomp.upcase
    
        unless @board.free_position?(position)
          puts "La case est déjà occupée, veuillez réessayer"
          play_turn
          return
        end
    
        @board.fill_position(position, current_player.symbol)
    
        if @board.victory?
          @status = current_player
        elsif @board.full?
          @status = "draw"
        else
          switch_player
        end
        turns_played += 1 
    end

    def game_end
      if @status == "draw"
        puts "La partie est terminée. C'est un match nul !"
      else
        puts "La partie est terminée. Le joueur #{current_player.name} a gagné !"
      end
  
      puts "Voulez-vous jouer une nouvelle partie ? (Oui/Non)"
      answer = gets.chomp.downcase
      if answer == "oui"
        new_game
      else
        puts "Merci d'avoir joué ! Au revoir !"
      end
    end
  
    def switch_player
      @current_player = @current_player == @players.first ? @players.last : @players.first
    end
  
    def new_games
      @board.reset
      @current_player = @players.first
      @status = "on going"
      play_turn
    end
  
  end
