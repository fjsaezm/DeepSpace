#encoding:utf-8

require_relative 'DamageToUI'
require_relative 'Weapon'

module Deepspace

    class Damage


        def initialize(w,s,weapons)
            @nShields = s
            @nWeapons = w 
            @weapons = weapons
        end
        
        def self.newNumericWeapons(w,s)
            new(w,s,Array.new)
        end

        def self.newSpecificWeapons(s,weapons)
            new(weapons.length,s,weapons)

        end

        def self.newCopy(d)
            new(d.nWeapons,d.nShields,d.weapons)
        end

        def getUIversion
            DamageToUI.new(self)
        end

        def arrayContainsType(w,t)
            ret = -1
            w.each do |weapon|
                if weapon.type == t
                    ret = w.index(weapon)
                    break
                end
            end
            ret
        end

        def adjust(w,s)
            new_wep = Array.new
            new_shields = min(@nShields,s)
            current_damage_weapons = Array.new(@weapons)

            w.each do |weapon|
                if arrayContainsType(current_damage_weapons,weapon.type)
                    new_wep.append(weapon.type
                    current_damage_weapons.delete(weapon.type)
                end
            end

            self.newSpecificWeapons(s,new_wep)
        end

        def discardWeapon(w)

        end

        def discardShieldBooster
        
        end

        def hasNoEffect

        end

        


        attr_reader :nShields, :nWeapons, :weapons
        private :arrayContainsType



    end

end
