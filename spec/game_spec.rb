require 'spec_helper'

module TicTacToe
  describe Game do
    let(:adam) {Player.new(name: 'Adam', character: 'X')}
    let(:isaac) {Player.new(name: 'Isaac', character: 'O')}

    context '#initialize' do
      it 'randomly selects a current_player' do
        allow_any_instance_of(Array).to receive(:shuffle).and_return([adam, isaac])
        game = Game.new([adam, isaac])
        expect(game.current_player).to eq adam
      end

      it 'randomly selects an other player' do
        allow_any_instance_of(Array).to receive(:shuffle).and_return([adam, isaac])
        game = Game.new([adam, isaac])
        expect(game.other_player).to eq isaac
      end
    end
  end
end
