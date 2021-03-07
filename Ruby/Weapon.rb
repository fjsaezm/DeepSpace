#encoding:utf-8

require_relative 'WeaponType.rb'

module Deepspace

    class Weapon

        def initialize(_name,_type,_uses)
            @name = _name
            @type = _type
            @uses = _uses
        end

        def self.newCopy(w)
            @name = w.name
            @type = w.type
            @uses = w.uses
            self
        end
        
        def type
            @type
        end

        def uses
            @uses
        end
        
        def power()
            @type.power()
        end

        def useIt()
            ret = 1.0
            if @uses > 0
                @uses = @uses - 1
                ret = self.power()
            end

            ret
        end
    end

end
