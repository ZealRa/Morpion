require 'bundler'
Bundler.require
require_relative 'board.rb'

class Game 
    attr_accessor :current_player, :status, :players, :board, :turns_played

    def initialize(board)
        puts "Bienvenue dans le jeu !"
        print "Joueur 1, veuillez entrer votre prénom : "
        player1_name = gets.chomp
        print "Joueur 2, veuillez entrer votre prénom : "
        player2_name = gets.chomp
        @players = [Player.new(player1_name, "X"), Player.new(player2_name, "O")]
        @status = "on going"
        @board = board
        @turns_played = 0
    end

    def free_position?(position)
        @board.board_cases[position].value == " "
    end
    
    def fill_position(position, symbol)
        @board.board_cases[position].value = symbol
    end

      
 def victory?
    winning_combinations = [
      ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], # lignes horizontales
      ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], # lignes verticales
      ["A1", "B2", "C3"], ["A3", "B2", "C1"] # diagonales
    ]
  
    winning_combinations.each do |combo|
      values = combo.map { |id| find_value(id) }
      if values.uniq.length == 1 && values.first != " "
        return true
      end
    end
    if @turns_played == 8
        @status == "draw"
        puts "C'est une égalité !"
        return true
    end
    false
 end

 def find_value(position)
    @board.board_cases[position].value
 end

    def play_turn
        @current_player = @turns_played.even? ? @players[0] : @players[1]

        puts "#Joueur #{@current_player.name}, c'est ton tour."
        puts "Saisis une case (e.g., A1, B2, C3):"
        position = gets.chomp.upcase
        
        if position.match?(/\A[ABC][1-3]\z/)
            if free_position?(position)
                fill_position(position, @current_player.symbol)
            else
                puts "La case est déjà occupée, veuillez réessayer"
                play_turn
            end
        else
            puts "Erreur : Entrée invalide. Veuillez entrer une case valide (e.g., A1, B2, C3)."
            play_turn
        end
    end

    def game_end
      if victory?
        puts "La partie est terminée. Le joueur #{current_player.name} a gagné !"
      end
      puts "Voulez-vous jouer une nouvelle partie ? (Oui/Non)"
      answer = gets.chomp.downcase
      if answer == "oui"
        Application.new.perform
      else
        puts "Merci d'avoir joué ! Au revoir !"
      end
    end
  
  end