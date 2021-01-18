module TicTacToe
  class Player
    attr_accessor :name, :character
    def initialize(args)
      @character = args.fetch(:character)
      @name = args.fetch(:name)
    end
  end
end
