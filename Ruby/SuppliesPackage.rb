#encoding:utf-8

module Deepspace

    class SuppliesPackage

        def initialize(ammoPower,fuelUnits,shieldPower)
            @ammoPower = ammoPower
            @fuelUnits = fuelUnits
            @shieldPower = shieldPower
        end

        def self.newCopy(sp)
            new(sp.ammoPower,sp.fuelUnits,sp.shieldPower)
        end

        def to_s()
            "This Supplies package gives fuel:" + @fuel + ", ammoPower:" + @ammoPower + ", shieldPower:" + @shieldPower
        end
        

        attr_reader :ammoPower, :fuelUnits, :shieldPower

        
    end

end
