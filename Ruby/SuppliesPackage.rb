#encoding:utf-8

module Deepspace

    class SuppliesPackage

        def initialize(_ammoPower,_fuelUnits,_shieldPower)
            @ammoPower = _ammoPower
            @fuelUnits = _fuelUnits
            @shieldPower = _shieldPower
        end

        def self.newCopy(sp)
            new(sp.ammoPower,sp.fuelUnits,sp.shieldPower)
        end

        def ammoPower
            @ammoPower
        end

        def fuelUnits
            @fuelUnits
        end

        def shieldPower
            @shieldPower
        end
        

        
    end

end
