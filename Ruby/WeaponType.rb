#encoding:utf-8

module Deepspace

    module WeaponType

        class Type

            @@LASERPOWER = 2.0
            @@MISSILEPOWER = 3.0
            @@PLASMAPOWER = 4.0

            def initialize(_power)
                @power = _power
            end

            def power()
                @power
            end

            def to_s
                if @power == @@LASERPOWER
                  "LASER"
                elsif @power == @@PLASMAPOWER
                  "PLASMA"
                elsif @power == @@MISSILEPOWER
                  "MISSILE"
                end
            end
        end

        LASER = Type.new(2.0)
        MISSILE = Type.new(3.0)
        PLASMA = Type.new(4.0)

       

    end
  
end
  
