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

    context '#switch_players' do
      it 'switches @current_player and @other_player' do
        game = Game.new([adam, isaac])
        current_player = game.current_player
        game.switch_players
        expect(game.other_player).to eq current_player
      end

      it 'sets @other_player to @current_player' do
        game = Game.new([adam, isaac])
        other_player = game.other_player
        game.switch_players
        expect(game.current_player).to eq other_player  
      end
    end
  end
end
