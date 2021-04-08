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
            ret = self.new(h.maxElements)
            ret.weapons = h.weapons.clone()
            ret.shieldBoosters = h.shieldBoosters.clone()
            ret
        end
        
        def getUIversion
            HangarToUI.new(self)
        end

        
        def spaceAvailable
            (@shieldBoosters.length() + @weapons.length()) < @maxElements
        end

        def addWeapon(w)
            ret = False
            if self.spaceAvailable
                @weapons << w
                ret = True
            end
            ret
        end

        def addShieldBooster(s)
            ret = False
            if self.spaceAvailable
                @shieldBoosters << s
                ret = True
            end
            ret
        end

        def removeWeapon(i)
            ret = nil
            if @weapons.length < i
                ret = @weapons[i]
                @weapons.delete_at(i)
            end
            ret
        end

        def removeShieldBooster(i)
            ret = nil
            if @shieldBoosters.length < i
                ret = @shieldBoosters[i]
                @shieldBoosters.delete_at(i)
            end
            ret
        end
        
        attr_reader :maxElements, :weapons, :shieldBoosters
        private :spaceAvailable



    end

end
