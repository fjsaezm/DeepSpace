#encoding:utf-8

require_relative 'BetaPowerEfficientSpaceStationToUI'
require_relative 'Transformation'
require_relative 'PowerEfficientSpaceStation'

module Deepspace

    class BetaPowerEfficientSpaceStation < PowerEfficientSpaceStation

        @@EXTRAEFFICIENCY = 1.2

        def initialize(station)
            self.copy(station)
            @dice = Dice.new
        end

        def fire
            f = super
            if @dice.extraEfficiency
                f *= @@EXTRAEFFICIENCY
            end
            f 
        end



    end

end
