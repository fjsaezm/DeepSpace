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
                if weapon.getType == t
                    ret = w.index(weapon)
                    break
                end
            end
            ret
        end


        attr_reader :nShields, :nWeapons, :weapons
        private :arrayContainsType



    end

end
