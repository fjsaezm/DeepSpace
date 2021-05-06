#encoding:utf-8

module Deepspace

    module WeaponType

        class Type

            CONSTLASERPOWER = 2.0
            CONSTMISSILEPOWER = 3.0
            CONSTPLASMAPOWER = 4.0

            def initialize(_power)
                @power = _power
            end

            def power()
                @power
            end

            def to_s
                if @power == CONSTLASERPOWER
                  ret = "LASER"
                elsif @power == CONSTPLASMAPOWER
                  ret ="PLASMA"
                elsif @power == CONSTMISSILEPOWER
                  ret ="MISSILE"
                end
                ret 
            end
        end

        LASER = Type.new(2.0)
        MISSILE = Type.new(3.0)
        PLASMA = Type.new(4.0)

       

    end
  
end
  
