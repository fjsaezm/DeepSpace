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
            nShields = [@nShields,s].min
            if @weapons.length == 0:
                ret = self.newNumericWeapons([@nWeapons,w.length].min,nShields)
            else
                copy = w.clone()
                newWeapons = Array.new
                weapons.each do |wType|
                    i = arrayContainsType(copy,wType)
                    if i != -1
                        newWeapons << wType
                        copy.delete(wType)
                    end
                end 

                ret = self.newSpecificWeapons(nShields, newWeapons )
            end
        end

        def discardWeapon(w)
            if @weapons.include? w.getType
                @weapons.delete(w.getType)
            end 

            if @nWeapons > 0
                @nWeapons = @nWeapons -1
            end
            
        end

        def discardShieldBooster
            if @nShields > 0
                @nShields = @nShields - 1
            end
        end

        def hasNoEffect
            (@nShields == 0) and (@nWeapons == 0) and (@weapons.length == 0)
        end



        attr_reader :nShields, :nWeapons, :weapons
        private :arrayContainsType



    end

end
