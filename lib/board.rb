require 'bundler'
Bundler.require
require_relative 'player'
require_relative 'game'
require_relative 'board_case'

class Board
  attr_accessor :board_cases

  def initialize
    @board_cases = {}
    ('A'..'C').each do |letter|
      (1..3).each do |number|
        position = "#{letter}#{number}"
        @board_cases[position] = BoardCase.new(position)
      end
    end
  end
end