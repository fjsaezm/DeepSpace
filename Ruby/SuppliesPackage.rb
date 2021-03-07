#encoding:utf-8

module deepspace

    class SuppliesPackage

        def initialize(_ammoPower,_fuelUnits,_shieldPower)
            @ammoPower = _ammoPower
            @fuelUnits = _fuelUnits
            @shieldPower = _shieldPower
        end

        def self.newCopy(sp)
            @ammoPower = sp.ammoPower
            @fuelUnits = sp.fuelUnits
            @shieldPower = sp.shieldPower
            self
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