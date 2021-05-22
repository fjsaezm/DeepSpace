#encoding:utf-8

require_relative 'SpecificDamageToUI'
require_relative 'Weapon'
require_relative 'Damage'

module Deepspace

    class SpecificDamage < Damage 

        def initialize(w,s)
            super(s)
            @weapons = w
        end
        

        def to_s
            ret = super + 
            wP = "\nWEAPONS = NONE"
            if !@weapons.empty?
                wP = "\n\WEAPONS : "
                @weapons.each { |w|
                    wP += "#{w.to_s} "
                }
            end
            ret = ret + wP
            ret
            
        end

        def getUIversion
            SpecificDamageToUI.new(self)
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
            newShields = adjustShields(s.size)
            old = w.clone()
            newWeapons = Array.new
            @weapons.each do |wType|
                i = arrayContainsType(old,wType)
                if i != -1
                    newWeapons << wType
                    old.delete_at(i)
                    i -= 1
                end
            end 

            SpecificDamage.new(newWeapons,newShields)
        end

        def discardWeapon(w)
            if @weapons.include? w.type
                @weapons.delete_at( @weapons.index(w.type) || @weapons.lenght)
            end
  
        end


        def hasNoEffect
            super && @weapons.size == 0
        end

        def copy
            SpecificDamage.new(@weapons,@nShields)
        end


        attr_reader :weapons
        private :arrayContainsType
        public_class_method :new



    end

end
