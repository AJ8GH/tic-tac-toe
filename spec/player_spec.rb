module TicTacToe
  describe Player do

    context '#initialize' do
      it 'raises exception when initialized with invalid hash' do
        expect { Player.new({}) }.to raise_error
      end
    end

    context 'getter methods' do
      before(:all) { @player = Player.new({name: 'name', character: 'X'}) }

      it 'returns the name' do
        expect(@player.name).to eq 'name'
      end

      it 'returns the character' do
        expect(@player.character).to eq 'X'
      end
    end
  end
end
