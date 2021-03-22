#encoding:utf-8

require_relative 'Dice'
require_relative 'GameStateController'
require_relative 'SpaceStation'


module Deepspace

    class GameUniverse

        @@WIN = 10

        def initialize()
            @currentStationIndex = 0
            @turns = 0
            @gameState = GameStateController.new
            @dice = Dice.new
            @
        end
        
    end

end
