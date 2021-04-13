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
            @fuelUnits = supplies.fuelUnits
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


        def cleanPendingDamage
            if @pendingDamage.hasNoEffect
                @pendingDamage = nil
            end
        end

        def discardHangar(i)

        end

        def discardShieldBooster(i)

        end

        def discardShieldBoosterInHangar(i)


            
        end

        def discardWeapon(i)

        end

        def discardWeaponInHangar(i)

        end

        def fire

        end

        def getSpeed

        end

        def getUIversion
            SpaceStationToUI.new(self)
        end

        def mountShieldBooster(i)

        end

        def mountWeapon(i)

        end

        def move
        end

        def protection

        end

        def receiveHangar(h)

        end

        def receiveShieldBooster(s)

        end

        def receiveShot(shot)

        end

        def receiveSupplies(s)

        end

        def receiveWeapon(w)

        end

        def validState
            if pendingDamage != nil

            

        end

        def assignFuelValue(f) 
            @fuelUnits = [f,@@MAXFUEL].min
        end

        def cleanPendingDamage 
            #Not done
            @pendingDamage=nil
        end


        private :assignFuelValue, :cleanPendingDamage
        attr_reader :ammoPower, :fuelUnits, :hangar, :name, :nMedals, :pendingDamage, :shieldBoosters, :shieldPower, :weapons
        attr_writer :damage , :loot

    end

end