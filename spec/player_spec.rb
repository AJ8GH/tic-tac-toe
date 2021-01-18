module TicTacToe
  describe Player do
    context '#initialize' do
      it 'raises exception when initialized with invalid hash' do
        expect { Player.new({}) }.to raise_error
      end
    end
  end
end
