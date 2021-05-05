#encoding:utf-8

require_relative 'EnemyToUI'
require_relative 'ShotResult'

module Deepspace

    class EnemyStarShip

        def initialize(n,a,s,l,d)
            @name = n 
            @ammoPower = a
            @shieldPower = s
            @loot = l
            @damage = d 
        end

        def to_s
            "+Enemy NAME: #{@name}.\n \tAmmoPower = #{@ammoPower}.\n \tShieldPower = #{@shieldPower}.\n \tLoot: #{@loot}.\n \t Damage: #{@damage} "
        end

        def self.newCopy(e)
            new(e.name,e.ammoPower,e.shieldPower,e.loot,e.damage)
        end

        def getUIversion
            EnemyToUI.new(self)
        end

        def fire
            @ammoPower
        end

        def protection
            @shieldPower
        end

        def receiveShot(shot)
           ret = ShotResult::DONOTRESIST
           if protection() >= shot
                ret = ShotResult::RESIST
           end
           ret
        end




        attr_reader :ammoPower, :damage, :loot, :shieldPower , :name 
        
    end

end
