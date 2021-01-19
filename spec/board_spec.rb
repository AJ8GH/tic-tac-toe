module TicTacToe
  describe Board do
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
          grid = [['', '', '' ],
                  ['', '', 'X'],
                  ['', '', '' ]]
          board = Board.new(grid: grid)
          expect(board.get_cell(2, 1)).to eq 'X'
        end
      end

      context '#set cell' do
        it 'updates the value of the cell object at (x, y) coordinate' do
          CellStruct = Struct.new(:value) # create a struct object so that board_spec.rb does not rely on Cell class
          grid = [[CellStruct.new('X'), '', ''],
                                 [ '',  '', ''],
                                 [ '',  '', '']]
          board = Board.new(grid: grid)
          board.set_cell(0, 0, 'O')
          expect(board.get_cell(0, 0).value).to eq 'O'
        end
      end
    end
  end
end
