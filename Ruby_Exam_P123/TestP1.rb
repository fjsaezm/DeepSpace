#encoding:utf-8


require_relative 'Loot.rb'
require_relative 'SuppliesPackage.rb'
require_relative 'ShieldBooster.rb'
require_relative 'Weapon.rb'
require_relative 'Dice.rb'
require_relative 'WeaponType.rb'

module Deepspace

  class TestP1

    def self.main
      puts "Main"
      l = Loot.new(1,2,3,4,5)
      supplies = SuppliesPackage.new(7.0,6.0,4.0)
      booster = ShieldBooster.new("Iron",4.0,2)
      w = Weapon.new("Gun",WeaponType::MISSILE,1)
      d = Dice.new

      boosterCopy = ShieldBooster.newCopy(booster)

      puts "Weapon type : #{w.type}"
      puts "Weapon usages : #{w.uses}"
      puts "Weapon power: #{w.power()}"
      puts "Weapon power in 1st shot : #{w.useIt()}"
      puts "Weapon power in 2nd shot : #{w.useIt()}"

      puts "ShieldBoost : #{booster.boost}"
      puts "Shield uses : #{booster.uses}"

      puts "Copy ShieldUses : #{boosterCopy.uses}"
      puts "Now I use the copy"
      boosterCopy.useIt

      puts "Original Usages left: #{booster.uses}"
      puts "Copy usages left: #{boosterCopy.uses}"

      puts "Obtained from loot!!!"
      puts "Supplies obtained : #{l.nSupplies}"
      puts "Weapons obtained : #{l.nWeapons}"
      puts "Shields obtained : #{l.nShields}"
      puts "Medals obtained : #{l.nMedals}"
      puts "Hangars obtained : #{l.nHangars}"

      puts "Power of the weapon obtained in supplies : #{supplies.ammoPower}"
      puts "Power of the shield obtained in supplies : #{supplies.shieldPower}"
      puts "Fuel obtained in supplies : #{supplies.fuelUnits}"


      nInitHangars = 0
      nInitWeapons3 = 0
      nInitWeapons2 = 0
      nInitWeapons1 = 0
      nInitShields = 0
      nFirstShotStarship = 0
      nMoves = 0

      for i in 0..1000
        nInitHangars += d.initWithNHangars()
        gen = d.initWithNWeapons
        if gen == 1
          nInitWeapons1 +=1
        elsif gen == 2
          nInitWeapons2 +=1
        else
          nInitWeapons3 +=1
        end

        nInitShields += d.initWithNShields
        nFirstShotStarship += d.firstShot == GameCharacter::SPACESTATION ? 1 : 0
        nMoves += d.spaceStationMoves(0.5) ? 1 : 0

      end

      puts "initWithNHangars :  #{nInitHangars} (the average should be 75)"
      puts "initWeapons3 :  #{nInitWeapons3} (the average should be 100-2*33 = 33)"
      puts "initWeapons2 :  #{nInitWeapons2} (the average should be 33)"
      puts "initWeapons1 :  #{nInitWeapons1} (the average should be 33)"
      puts "initNShields :  #{nInitShields} (the average should be 75)"
      puts "nFirstShotsStarship : #{nFirstShotStarship} (the average should be 50)"
      puts "nMoves :  #{nMoves} (the average should be 50)"


    end

  end

TestP1.main()

end
