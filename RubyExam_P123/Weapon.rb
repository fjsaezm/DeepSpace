#encoding:utf-8

require_relative 'WeaponType'
require_relative 'WeaponToUI'
module Deepspace

    class Weapon

        def initialize(name,type,uses)
            @name = name
            @type = type
            @uses = uses
        end

        def self.newCopy(w)
            new(w.name,w.type,w.uses)
        end
        
        def power
            @type.power()
        end

        def useIt
            ret = 1.0
            if @uses > 0
                @uses = @uses - 1
                ret = power()
            end

            ret
        end

        def getUIversion
            WeaponToUI.new(self)
        end

        def to_s
            "This weapon is: #{@name}, type is #{@type} and uses #{@uses}"
        end

        attr_reader :type, :uses ,:name
    end

end
