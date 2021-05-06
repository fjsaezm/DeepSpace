#encoding:utf-8
require_relative 'Damage'
require_relative 'Weapon'
require_relative 'WeaponType'

module P3

    class ExamenP3


        def Principal
            # Create the damages
            d1 = Deepspace::Damage.newNumericWeapons(2,1)
            d2 = Deepspace::Damage.newSpecificWeapons([Deepspace::WeaponType::LASER,Deepspace::WeaponType::MISSILE,Deepspace::WeaponType::PLASMA],1)

            # Create weapon arrays
            stationWeapons1 = Array.new
            stationWeapons2 = Array.new
            
            w1 = Deepspace::Weapon.new("Láser normal",Deepspace::WeaponType::LASER,2)
            w2 = Deepspace::Weapon.new("Misil ACME",Deepspace::WeaponType::MISSILE,1)
            w3 =  Deepspace::Weapon.new("Cañón ACME",Deepspace::WeaponType::PLASMA,1)
            
            # Adjust damages

            # Print damages
            puts d1.to_s
            puts d2.to_s

        end

    end

    
end

P3::ExamenP3::ExamenP3.new.Principal