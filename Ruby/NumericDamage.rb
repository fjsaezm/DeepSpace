#encoding:utf-8

require_relative 'NumericDamageToUI'
require_relative 'Damage'

module Deepspace

    class NumericDamage < Damage 

        def initialize(w,s)
            super(s)
            @nWeapons = w
        end
        

        def to_s
            super() + "\nNWeapons : #{@nWeapons}"
            
        end

        def getUIversion
            NumericDamageToUI.new(self)
        end


        def adjust(w,s)
            NumericDamage.new(adjustShields(s.size),[w.size,@nWeapons].min)
        end

        def discardWeapon(w)
            if @nWeapons > 0
                    @nWeapons = @nWeapons -1
            end
  
        end


        def hasNoEffect
            super && @nWeapons == 0
        end

        def copy
            NumericDamage.new(@nWeapons,@nShields)
        end




        attr_reader :nWeapons
        public_class_method :new



    end

end
