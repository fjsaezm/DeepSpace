#encoding:utf-8

module deepspace

    module WeaponType

        class Type

            def initialize(_power)
                @power = _power
            end

            def power()
                @power
            end
        end

        LASER = WeaponType(2.0)
        MISSILE = WeaponType(3.0)
        PLASMA = WeaponType(4.0)


    end
  
end
  