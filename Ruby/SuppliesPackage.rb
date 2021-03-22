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

        def to_s()
            "This Supplies package gives fuel:" + @fuel + ", ammoPower:" + @ammoPower + ", shieldPower:" + @shieldPower
        end
        

        
    end

end
