#encoding:utf-8

require_relative 'PowerEfficientSpaceStationToUI'
require_relative 'Transformation'
require_relative 'SpaceStation'

module Deepspace

    class PowerEfficientSpaceStation < SpaceStation

        @@EFFICIENCYFACTOR = 1.1

        def initialize(station)
            self.copy(station)
        end

        def fire
            super*@@EFFICIENCYFACTOR
        end

        def protection
            super*@@EFFICIENCYFACTOR
        end

        def setLoot(loot)
            t = super(loot)
            if (t == Transformation::SPACECITY)
                t = Transformation::NOTRANSFORM
            end 
            t 
        end

    end

end
