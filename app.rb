require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'board_case'
require 'board'
require 'game'
require 'player'
require 'show.rb' 
require 'application.rb'

# board = Board.new
# game = Game.new(board)
# game.play_turn
# show = Show.new
# #board = Board.new
# show.show_board(board)


Application.new.perform

