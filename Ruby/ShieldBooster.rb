#encoding:utf-8

module Deepspace

    class ShieldBooster

        def initialize(_name,_boost,_uses)
            @name = _name
            @boost = _boost
            @uses = _uses
        end

        def self.newCopy(sb)
            new(sb.name,sb.boost,sb.uses)
        end

        def boost
            @boost
        end

        def uses
            @uses
        end

        def useIt
            ret = 1.0
            if @uses > 0
                @uses = @uses - 1
                ret = @boost
            end

            ret
        end

        
    end

end
