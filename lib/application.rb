require 'bundler'
Bundler.require
require_relative 'player'
require_relative 'game'
require_relative 'board_case'
require_relative 'board'
require_relative 'show'


class Application
  def perform
     board = Board.new
     game = Game.new(board)
     show = Show.new
     until game.victory?
      show.show_board(board)
       game.play_turn
     end  
     show.show_board(board)
     game.game_end
  end
end