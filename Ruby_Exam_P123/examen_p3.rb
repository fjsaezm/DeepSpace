#encoding:utf-8


module P3

    class ExamenP3


        def self.Principal
            # Create the damages
            d1 = Damage.newNumericWeapons(2,1)
            d2 = Damage.newSpecificWeapons([WeaponType::LASER,WeaponType::MISSILE,WeaponType::PLASMA],1)

            # Create weapon arrays
            stationWeapons1 = Array.new
            stationWeapons2 = Array.new
            
            w1 = Weapon.new("Láser normal",WeaponType::LASER,2)
            w2 = Weapon.new("Misil ACME",WeaponType::MISSILE,1)
            w3 =  Weapon.new("Cañón ACME",WeaponType::PLASMA,1))
            
            # Adjust damages

            # Print damages
            puts d1.to_s
            puts d2.to_s

        end

    end

end


P3::ExamenP3.Principal