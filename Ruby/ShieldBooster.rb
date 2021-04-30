#encoding:utf-8

require_relative 'ShieldToUI'

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

        def useIt
            ret = 1.0
            if @uses > 0
                @uses = @uses - 1
                ret = @boost
            end

            ret
        end

        def getUIversion
            ShieldToUI.new(self)
        end

        def to_s()
            "This Shield Booster is:" + @name + ", with boost:" + @boost + ", and uses:" + @uses
        end

        attr_reader :boost, :uses, :name
        
    end

end
