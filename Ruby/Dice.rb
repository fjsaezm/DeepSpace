#encoding:utf-8

require_relative 'GameCharacter.rb'

module Deepspace

    class Dice

        NHANGARSPROBCONST = 0.25
        NSHIELDSPROBCONST = 0.25
        NWEAPONSPROBCONST = 0.33
        FIRSTSHOTPROBCONST = 0.5
        
        def initialize()
            @NHANGARSPROB = NHANGARSPROBCONST
            @NSHIELDSPROB = NSHIELDSPROBCONST
            @NWEAPONSPROB = NWEAPONSPROBCONST
            @FIRSTSHOTPROB = FIRSTSHOTPROBCONST
            @generator = Random.new
        end

        def to_s()
            "This Dice has: @NHANGARSPROB =" + @NHANGARSPROB + ", NSHIELDSPROB=" + @NSHIELDSPROB + ", NWEAPONSPROB=" + @NWEAPONSPROB + ", FIRSTSHOTPROB=" + @FIRSTSHOTPROB
        end
        def initWithNHangars()
            ret = 1
            r = @generator.rand
            if r < @NHANGARSPROB
                ret = 0
            end

            ret
        end

        def initWithNWeapons()
            ret = 3
            r = @generator.rand
            if r < @NWEAPONSPROB
                ret = 1
                
            elsif @NWEAPONSPROB < r and r < 2*@NWEAPONSPROB
                ret = 2
            end

            ret
        end

        def initWithNShields()
            ret = 1
            r = @generator.rand
            if r < @NSHIELDSPROB
                ret = 0
            end

            ret
        end

        def whoStarts(n)
            @generator.rand(n)
        end

        def firstShot

          ret = GameCharacter::ENEMYSTARSHIP
          r = @generator.rand
          if r < @FIRSTSHOTPROB
            ret = GameCharacter::SPACESTATION
          end

          ret
         

        end

        def spaceStationMoves(speed)
          r = @generator.rand
          ret = false
          if r < speed
            ret = true
          end
        end
    end

end
