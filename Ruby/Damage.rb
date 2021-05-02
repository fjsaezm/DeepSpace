#encoding:utf-8

require_relative 'DamageToUI'
require_relative 'Weapon'

module Deepspace

    class Damage

        @@NOTUSED = -1

        def initialize(w,s,weapons)
            @nShields = s
            @nWeapons = w 
            @weapons = weapons
        end
        
        def self.newNumericWeapons(w,s)
            new(w,s,nil)
        end

        def self.newSpecificWeapons(weapons,s)
            new(@@NOTUSED,s,weapons)

        end

        def self.newCopy(d)
            new(d.nWeapons,d.nShields,d.weapons)
        end

        def to_s
            "NWeapons:#{@nWeapons} \n NShields:#{@nShields} \n Weapons:#{@weapons}"
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
            puts "Habrá que ajustar, tenemos que las weapons son #{@nWeapons}"
            newShields = [@nShields,s].min
            print("We have #{@nShields} and #{s} so the min is #{newShields}")
            if @nWeapons != @@NOTUSED 
                ret = self.class.newNumericWeapons([@nWeapons,w.length].min,newShields)
                print("Devolveremos tipo numerico con #{ret.nWeapons} armas y #{ret.nShields} escudos")
            else
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

                ret = self.class.newSpecificWeapons(newWeapons,newShields)
            end
            puts ret.inspect
            # Return empty damage if adjust is empty
            if ret.hasNoEffect
                puts "Ojo porque ret has no effect"
                puts ret.inspect
                ret = nil
            end
            ret
        end

        def discardWeapon(w)
            if @nWeapons == @@NOTUSED
                if @weapons.include? w.type
                    @weapons.delete(w.type)
                end 
            else
                if @nWeapons > 0
                    @nWeapons = @nWeapons -1
                end
            end
            
        end

        def discardShieldBooster
            if @nShields > 0
                @nShields = @nShields - 1
            end
        end

        def hasNoEffect
            if @nWeapons == @@NOTUSED
                ret = (@weapons.length == 0 && @nShields == 0)
            else
                ret = (@nShields == 0 && @nWeapons == 0)
            end
            puts "La verdad es que tiene el efecto: #{ret}"
            ret
        end



        attr_reader :nShields, :nWeapons, :weapons
        private :arrayContainsType



    end

end
