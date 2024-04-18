class Application
  def perform
     game = Game.new
     show = Show.new
     while game.status == "on going"
       show.show_board(game.board)
       game.turn
     end
     game.game_end
  end
 end