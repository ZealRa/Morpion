require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'board_case'
require 'board'
require 'game'
require 'player'
require 'show.rb' 

game = Game.new
game.play_turn
show = Show.new
show.show_board(board)


#Application.new.perform