module TicTacToe
  class Game
    attr_accessor :board, :players, :current_player, :other_player
    def initialize(players, board = Board.new)
      @board = board
      @players = players
      @current_player, @other_player = players.shuffle
    end
  end
end
