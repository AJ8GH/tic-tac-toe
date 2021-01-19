module TicTacToe
  class Game
    attr_accessor :board, :players, :current_player, :other_player
    def initialize(players, board = Board.new)
      @board = board
      @players = players
      @current_player, @other_player = players.shuffle
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    
  end
end
