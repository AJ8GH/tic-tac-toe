module TicTacToe
  describe Board do
    # create a struct object so that board_spec.rb does not rely on Cell class
    before(:all) { CellStruct = Struct.new(:value) }
    let(:o) { CellStruct.new('O') }
    let(:x) { CellStruct.new('X') }
    let(:e) { CellStruct.new('') }

    context '#initialize' do
      it 'can be initialized with a hash' do
        expect { Board.new({grid: 'grid'}) }.not_to raise_error
      end

      context '#default_grid' do
        before(:all) { @board = Board.new }

        it 'creates a grid with three rows by defualt' do
          expect(@board.grid.size).to eq 3
        end

        it 'creates three things in each row by default' do
          expect(@board.grid[0].length).to eq 3
        end
      end

      context '#grid' do
        it 'returns the value of the grid' do
          board = Board.new(grid: 'grid')
          expect(board.grid).to eq 'grid'
        end
      end

      context '#get_cell' do
        it 'returns the cell based on the (x, y) coordinate' do
          grid = [[e, e, e],
                  [e, e, x],
                  [e, e, e]]
          board = Board.new(grid: grid)
          expect(board.get_cell(2, 1).value).to eq 'X'
        end
      end

      context '#set cell' do
        it 'updates the value of the cell object at (x, y) coordinate' do
          grid = [[x, e, e],
                 [ e, e, e],
                 [ e, e, e]]
          board = Board.new(grid: grid)
          board.set_cell(0, 0, 'O')
          expect(board.get_cell(0, 0).value).to eq 'O'
        end
      end

      context '#game_over' do
        before(:all) { @board = Board.new }

        it 'returns :winner if winner? is true' do
          allow(@board).to receive(:winner?).and_return(true)
          expect(@board.game_over).to eq :winner
        end

        it 'returns :draw if winner? is false and draw? is true' do
          allow(@board).to receive(:winner?).and_return(false)
          allow(@board).to receive(:draw?).and_return(true)
          expect(@board.game_over).to eq :draw
        end

        it 'returns false if winner? is false and draw? is false' do
          allow(@board).to receive(:winner?).and_return(false)
          allow(@board).to receive(:draw?).and_return(false)
          expect(@board.game_over).to be false
        end
      end

      context '#draw?' do

        it 'returns true if no cells are empty' do
          grid = Array.new(3) {Array.new(3) { CellStruct.new(rand) } }
          board = Board.new(grid: grid)
          expect(board.draw?).to be true
        end

        it 'returns false if board is empty' do
          expect(Board.new.draw?).to be false
        end

        it 'returns false if one cell is empty' do
          grid = [[x, o, x],
                  [o, o, x],
                  [o, x, e]]
          board = Board.new(grid: grid)
          expect(board.draw?).to be false
        end
      end
    end
  end
end
