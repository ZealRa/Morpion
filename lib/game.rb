require 'bundler'
Bundler.require
require_relative '/home/zealra/THP/semaine_4/morpion/lib/board.rb'

class Game 
    attr_accessor :current_player, :status, :players, :board, :turns_played

    def initialize(board)
        puts "Bienvenue dans le jeu !"
        print "Joueur 1, veuillez entrer votre prénom : "
        player1_name = gets.chomp
        print "Joueur 2, veuillez entrer votre prénom : "
        player2_name = gets.chomp
        @players = [Player.new(player1_name, "X"), Player.new(player2_name, "O")]
        @current_player = @players.first
        @status = "on going"
        @board = board
        @turns_played = 0
    end

    def new_games
        Board.reset
        @current_player = @players.first
        @status = "on going"
        play_turn
      end

    def free_position?(position)
        @board.board_cases[position].value == " "
    end
    
    def fill_position(position, symbol)
        @board.board_cases[position].value = symbol
    end
    
    def switch_player
        @current_player = @current_player == @players.first ? @players.last : @players.first
    end
    
    # def victory?
    #     winning_combinations = [
      
    #       %w[A1 B1 C1], %w[A2 B2 C2], %w[A3 B3 C3],
 
    #       %w[A1 A2 A3], %w[B1 B2 B3], %w[C1 C2 C3],

    #       %w[A1 B2 C3], %w[A3 B2 C1]
    #     ]
      
    #     winning_combinations.each do |combination|
    #         if
    #             combination.map { |pos| @board.board_cases[pos].value }.uniq.length == 1 &&
    #             !@board.board_cases[combination[0]].value.empty?
    #             return true
    #         end
    #     end
    #     return false
      
    #     if @board.turns_played == 9
    #       puts "It's a draw!"
    #       return true
    #     end
      
    #     false
    # end

    
      
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
  
    false
 end

 def find_value(position)
    @board.board_cases[position].value
 end

    def play_turn
        @current_player = @turns_played.even? ? "X" : "O"

        puts "#Joueur #{@current_player}, c'est ton tour."
        puts "Saisis une case (e.g., A1, B2, C3):"
        position = gets.chomp.upcase
        
    
        unless free_position?(position)
          puts "La case est déjà occupée, veuillez réessayer"
          play_turn
        end
    
        fill_position(position, @current_player)
    
        if victory?
          @status = @current_player
        else
          switch_player
        end
        @turns_played += 1 
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
        new_games
      else
        puts "Merci d'avoir joué ! Au revoir !"
      end
    end
  
  end
