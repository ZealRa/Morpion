require 'bundler'
Bundler.require
require_relative 'player'
require_relative 'game'

class Board
  attr_accessor :board_cases, :turns_played

  def initialize
    @board_cases = {}
    ('A'..'C').each do |letter|
      (1..3).each do |number|
        position = "#{letter}#{number}"
        @board_cases[position] = BoardCase.new(position)
      end
    end
    @turns_played = 0
  end

  def free_position?(position)
    @board_cases[position].value == " "
  end

  def victory?
    ['A', 'B', 'C'].each do |column|
      if @board_cases["#{column}1"].value == @board_cases["#{column}2"].value &&
         @board_cases["#{column}2"].value == @board_cases["#{column}3"].value &&
         !@board_cases["#{column}1"].value.empty?
        puts "Player #{@board_cases["#{column}1"].value} wins!"
        return true
      end
    end
  
    (1..3).each do |row|
      if @board_cases["A#{row}"].value == @board_cases["B#{row}"].value &&
         @board_cases["B#{row}"].value == @board_cases["C#{row}"].value &&
         !@board_cases["A#{row}"].value.empty?
        puts "Player #{@board_cases["A#{row}"].value} wins!"
        return true
      end
    end
  
    if (@board_cases["A1"].value == @board_cases["B2"].value && @board_cases["B2"].value == @board_cases["C3"].value) ||
       (@board_cases["A3"].value == @board_cases["B2"].value && @board_cases["B2"].value == @board_cases["C1"].value) &&
       !@board_cases["B2"].value.empty?
      puts "Player #{@board_cases["B2"].value} wins!"
      return true
    end
  
    if @turns_played == 9
      puts "It's a draw!"
      return true
    end
  
    false
  end
end