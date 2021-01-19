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
    end

    def game_over
      winner? ? :winner : draw? ? :draw : false
    end

    def draw?
      grid.flatten.map(&:value).none_empty?
    end

    def winner?
      winning_positions.each do |winning_position|
        next if winning_position_values(winning_position).all_empty?
        return true if winning_position_values(winning_position).all_same?
      end
      false
    end

    def winning_position_values(winning_position)
      winning_position.map(&:value)
    end

    def formatted_grid
      puts [" #{get_cell(0, 0).value} | #{get_cell(1, 0).value} | #{get_cell(2, 0).value} \n",
            "___|___|___\n",
            " #{get_cell(0, 1).value} | #{get_cell(1, 1).value} | #{get_cell(2, 1).value} \n",
            "___|___|___\n",
            " #{get_cell(0, 2).value} | #{get_cell(1, 2).value} | #{get_cell(2, 2).value} "].join
    end

    private

    def default_grid
      Array.new(3) { Array.new(3) { Cell.new } }
    end

    def winning_positions
      grid +
      grid.transpose +
      diagonals
    end

    def diagonals
      [ [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2)],
        [get_cell(0, 2), get_cell(1, 1), get_cell(2, 0)] ]
    end
  end
end
