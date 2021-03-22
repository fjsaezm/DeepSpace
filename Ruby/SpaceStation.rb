#encoding:utf-8

require_relative 'SuppliesPackage'
require_relative 'SpaceStationToUI'
require_relative 'Damage'

module Deepspace

    class SpaceStation

        @@MAXFUEL = 100
        @@SHIELDLOSSPERUNITSHOT = 0.1


        def initialize(name,supplies)
            @name = Name
            @ammoPower = supplies.ammoPower
            @fuelUnits = supplies.fuelUnits
            @nMedals = 0
            @shieldPower = supplies.shieldPower
            @weapons = Array.new
            @shieldBoosters = Array.new
            @hangar = nil
            @pendingDamage = nil
        end

        def assignFuelValue(f)
            @fuelUnits = min(@@MAXFUEL,f)
        end

        def cleanPendingDamage
            if @pendingDamage.has
            @pendingDamage = nil
        end

        def cleanUpMountedItems

        end

        def discardHangar

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
            new SpaceStationToUI(self)
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

        def receiveShieldBoosters(s)

        end

        def receiveShot(shot)

        end

        def receiveSupplies(s)

        end

        def receiveWeapon(w)

        end

        def setLoot(loot)

        end

        def setPendingDamage(d)

        end

        def validState

        end

        attr_reader :ammoPower, :fuelUnits , :nMedals , :shieldPower ,:pendingDamage , :shieldBoosters , :shieldPower , :name ,:weapons
        private :assignFuelValue , :cleanPendingDamage 
    end

end