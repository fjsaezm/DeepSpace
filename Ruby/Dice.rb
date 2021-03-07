#encoding:utf-8

module deepspace

    class Dice

        NHANGARSPROBCONST = 0.25
        NSHIELDSPROBCONST = 0.25
        NWEAPONSPROBCONST = 0.33
        FIRSTSHOTPROBCONST = 0.5
        
        def initialize()
            @NHANGARSPROB = NHANGARSPROBCONST
            @NSHIELDSPROB = NSHIELDSPROBCONST
            @NWEAPONSPROB = NWEAPONSPROBCONST
            @FIRSTSHOTPROB = FIRST
            @generator = Random.new
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
            if r < @NHANGARSPROB
                ret = 1
                
            elsif @NHANGARSPROB < r and r < 2*@NHANGARSPROB
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
            @generator.(n)
        end
    end

end