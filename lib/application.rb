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
     while game.status == "on going"
       show.show_board(board)
       game.play_turn
       game.switch_player
     end
     game.game_end
  end
end