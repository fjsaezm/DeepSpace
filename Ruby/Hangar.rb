#encoding:utf-8

require_relative 'HangarToUI'

module Deepspace

    class Hangar

        def initialize(maxElements)
            @maxElements = maxElements
            @weapons = Array.new
            @shieldBoosters = Array.new
        end

        def self.newCopy(h)
            ret = new(h.maxElements)
            for i in (0...h.shieldBoosters.size)
                ret.addShieldBooster(h.shieldBoosters[i])
            end
            for i in (0...h.weapons.size)
                ret.addWeapon(h.weapons[i])
            end
            ret
        end
        
        def getUIversion
            HangarToUI.new(self)
        end

        
        def spaceAvailable
            (@shieldBoosters.length() + @weapons.length()) < @maxElements
        end

        def addWeapon(w)
            ret = false
            if spaceAvailable()
                @weapons << w
                ret = true
            end
            ret
        end

        def addShieldBooster(s)
            ret = false
            if self.spaceAvailable
                @shieldBoosters << s
                ret = true
            end
            ret
        end

        def removeWeapon(i)
            ret = nil
            if i >= 0 and i < @weapons.length 
                ret = @weapons[i].clone()
                @weapons.delete_at(i)
            end
            ret
        end

        def removeShieldBooster(i)
            ret = nil
            if i >= 0 and i < @shieldBoosters.length 
                ret = @shieldBoosters[i].clone()
                @shieldBoosters.delete_at(i)
            end
            ret
        end
        
        attr_reader :maxElements, :weapons, :shieldBoosters
        private :spaceAvailable



    end

end
