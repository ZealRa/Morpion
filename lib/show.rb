require 'bundler'
Bundler.require



class Show
  def show_board(board)
    puts "   A   B   C"
    puts "1  #{board.board_cases['A1'].value} | #{board.board_cases['B1'].value} | #{board.board_cases['C1'].value}"
    puts "  ---|---|---"
    puts "2  #{board.board_cases['A2'].value} | #{board.board_cases['B2'].value} | #{board.board_cases['C2'].value}"
    puts "  ---|---|---"
    puts "3  #{board.board_cases['A3'].value} | #{board.board_cases['B3'].value} | #{board.board_cases['C3'].value}"
  end
end


# board = Board.new
# show = Show.new

# show.show_board(board)
