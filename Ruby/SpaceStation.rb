#encoding:utf-8

require_relative 'SpaceStationToUI'
require_relative 'SuppliesPackage'
require_relative 'CardDealer'

module Deepspace

    class SpaceStation

        @@SHIELDLOSSPERUNITSHOT = 0.1
        @@MAXFUEL = 100
        

        def initialize(n,supplies)
            
            @ammoPower = 
            @fuelUnits = 
            @name = n
            @nMedals = 0
            @shieldPower = 0
            @hangar = nil
            @shieldBoosters = Array.new
            @weapons = Array.new
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

        def cleanUpMountedItems

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

        end

        def assignFuelValue(f) #
            @fuelUnits = [f,@@MAXFUEL].min
        end

        def cleanPendingDamage #private
            @pendingDamage=nil
        end


        private :assignFuelValue, :cleanPendingDamage
        attr_reader :ammoPower, :fuelUnits, :hangar, :name, :nMedals, :pendingDamage, :shieldBoosters, :shieldPower, :weapons
        attr_writer :damage , :loot

    end

end