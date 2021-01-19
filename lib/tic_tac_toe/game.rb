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

    def request_move
      "#{current_player.name}: Enter a number between 1 and 9 to make your move"
    end

    def move_number_layout
      [
      "     |     |     \n  1  |  2  |  3  \n_____|_____|_____\n",
      "     |     |     \n  4  |  5  |  6  \n_____|_____|_____\n",
      "     |     |     \n  7  |  8  |  9  \n     |     |     "
    ].join
    end

    def get_move(human_move = gets.chomp)
      human_move_to_coordinate(human_move)
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "The game ended in a tie" if board.game_over == :draw
    end

    def play
      puts "#{current_player.name} to play first"
      while true
        board.formatted_grid
        puts request_move
        puts move_number_layout
        x, y = get_move
        board.set_cell(x, y, current_player.character)
        if board.game_over
          puts game_over_message
          board.formatted_grid;
          puts 'Would you like to play again? y/n'
          answer = gets.chomp
          if answer == 'y'
            play
          elsif answer == 'n'
            puts 'Bye!'; break
          end
        else
          switch_players
        end
      end
    end

    private

    def human_move_to_coordinate(human_move)
      mapping = {
        '1' => [0, 0],
        '2' => [1, 0],
        '3' => [2, 0],
        '4' => [0, 1],
        '5' => [1, 1],
        '6' => [2, 1],
        '7' => [0, 2],
        '8' => [1, 2],
        '9' => [2, 2]
      }
      mapping[human_move]
    end
  end
end
