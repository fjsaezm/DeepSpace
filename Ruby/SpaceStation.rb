#encoding:utf-8

require_relative 'SpaceStationToUI'
require_relative 'SuppliesPackage'
require_relative 'CardDealer'
require_relative 'Damage'

module Deepspace

    class SpaceStation

        @@SHIELDLOSSPERUNITSHOT = 0.1
        @@MAXFUEL = 100
        

        def initialize(n,supplies)
            @name = n
            @ammoPower = supplies.ammoPower
            assignFuelValue(supplies.fuelUnits)
            @nMedals = 0
            @shieldPower = supplies.shieldPower
            @weapons = Array.new
            @shieldBoosters = Array.new
            @hangar = nil
            @pendingDamage = nil
        end

        def cleanUpMountedItems
            @weapons.each do |w|
                if w.uses == 0
                    @weapons.delete(w)
                end
            end

            @shieldBoosters.each do |s|
                if s.uses == 0
                    @shieldBoosters.delete(s)
                end
            end
        end


        def assignFuelValue(f) 
            @fuelUnits = [f,@@MAXFUEL].min
        end
    
        def cleanPendingDamage 
            if @pendingDamage != nil
                if @pendingDamage.hasNoEffect
                    @pendingDamage = nil
                end
            end
        end

        def discardHangar(i)
            @hangar = nil
        end

        def discardShieldBooster(i)
            if i >= 0 and i < @shieldBoosters.length
                s = @shieldBoosters.delete_at(i)

                if @pendingDamage != nil
                    @pendingDamage.discardShieldBooster
                    cleanPendingDamage()
                end
            end

        end

        def discardShieldBoosterInHangar(i)
            if @hangar != nil
                @hangar.discardShieldBooster(i)
            end
        end

        def discardWeapon(i)
            if i >= 0 and i < @weapons.length
                w = @weapons.delete_at(i)

                if @pendingDamage != nil
                    @pendingDamage.discardWeapon(w)
                    cleanPendingDamage()
                end
            end
        end

        def discardWeaponInHangar(i)
            if @hangar != nil
                @hangar.discardWeapon(i)
            end
        end

        def fire
            factor = 1
            @weapons.each do |w|
                factor *= w.useIt
            end
            factor = @ammoPower * factor
            factor
        end

        def speed
            @fuelUnits/@@MAXFUEL
        end

        def getUIversion
            SpaceStationToUI.new(self)
        end

        def mountShieldBooster(i)
            if @hangar != nil
                s = @hangar.removeShieldBooster(i)
                if s != nil
                    @shieldBoosters << s
                end
            end
        end

        def mountWeapon(i)

            if @hangar != nil
                w = @hangar.removeWeapon(i)
                if w != nil
                    @weapons << w
                end
            end

        end

        def move
            @fuelUnits = [@fuelUnits - speed(),0 ].max
        end

        def protection
            factor = 1
            @shieldBoosters.each do |s|
                factor *= s.useIt
            end
            factor = @shieldPower * factor
            factor
        end

        def receiveHangar(h)
            if @hangar == nil
                @hangar = h
            end

        end

        def receiveShieldBooster(s)
            ret = false
            if @hangar != nil
                ret = @hangar.addShieldBooster(s)
            end
            ret
        end

        def receiveShot(shot)
            myProtection = protection()
            ret = ShotResult::DONOTRESIST

            if myProtection >= shot
                @shieldPower = [@shieldPower -@@SHIELDLOSSPERUNITSHOT*shot,0 ].max
                ret = ShotResult::RESIST
            else
                @shieldPower = 0.0

            end
            ret
        end

        def receiveSupplies(s)
            @ammoPower += s.ammoPower
            @fuelUnits += s.fuelUnits
            @shieldPower += s.shieldPower

        end

        def receiveWeapon(w)
            ret = false 
            if @hangar != nil
                ret = @hangar.addWeapon(w)
            end
            ret
        end

        def validState
            ret = true
            if @pendingDamage != nil
                if !@pendingDamage.hasNoEffect
                    ret = false
                end
            end
            ret
        end

        def setPendingDamage(d)
            adj = d.adjust(@weapons,@shieldBoosters.length)
            @pendingDamage = adj
        end

        def setLoot(loot)

            dealer = CardDealer.instance

            if loot.nHangars > 0
                puts "Mira como recivo un hangar"
                h = dealer.nextHangar
                puts h.inspect
                receiveHangar(h)
            end

            elements = loot.nSupplies
            for i in 0..elements
                sup = dealer.nextSuppliesPackage
                receiveSupplies(sup)
            end

            elements = loot.nWeapons
            for i in 0..elements
                weap = dealer.nextWeapon
                receiveWeapon(weap)
            end

            elements = loot.nShields
            for i in 0..elements
                sh = dealer.nextShieldBooster
                receiveShieldBooster(sh)
            end

            @nMedals += loot.nMedals
        end
        


        private :assignFuelValue, :cleanPendingDamage
        attr_reader :ammoPower, :fuelUnits, :hangar, :name, :nMedals, :pendingDamage, :shieldBoosters, :shieldPower, :weapons
        attr_writer :damage , :loot

    end

end