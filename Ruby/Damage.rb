#encoding:utf-8

require_relative 'DamageToUI'

module Deepspace

    class Damage

        NOTUSED = -1

        def initialize(s)
            @nShields = s
        end
        

        def to_s
            "Damage:\nNShields: #{@nShields}"
        end

        def getUIversion
            DamageToUI.new(self)
        end

        def hasNoEffect
            @nShields == 0
        end

        def discardShieldBooster
            if @nShields > 0
                @nShields -= 1
            end
        end

        def adjustShields(s)
            [@nShields,s].min
        end




        attr_reader :nShields
        private_class_method :new



    end

end
