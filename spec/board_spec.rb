module TicTacToe
  describe Board do
    context '#initialize' do
      it 'can be initialized with a valid hash' do
        expect { Board.new({grid: 'grid'}) }.to_not raise_error
      end
    end
  end
end
