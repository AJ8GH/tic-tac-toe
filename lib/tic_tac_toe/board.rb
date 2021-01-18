module TicTacToe
  class Board
    attr_accessor :grid

    def initialize(args = {})
      @grid = args.fetch(:grid, default_grid)
    end

    def get_cell(x, y)
      grid[y][x]
    end

    def set_cell(x, y, value)
      get_cell(x, y).value = value

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end
  end
end
