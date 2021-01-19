require_relative '../lib/tic_tac_toe'

puts 'Welcome to tic tac toe'
adam = TicTacToe::Player.new(name: 'Adam', character: 'X')
isaac = TicTacToe::Player.new(name: 'Isaac', character: 'O')
TicTacToe::Game.new([adam, isaac]).play
