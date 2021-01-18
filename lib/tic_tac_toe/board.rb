module TicTacToe
  class Board
    attr_accessor :grid
    def initialize(args)
      @grid = args.fetch(:grid)
    end
  end
end
