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

        def self.newCopy(e)
            self.new(e.name,e.ammoPower,e.shieldPower,e.loot,e.damage)
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
           ret = ShotResult.DONOTRESIST
           if self.protection >= shot
                ret = ShotResult.RESIST
           end
           ret
        end




        attr_reader :ammoPower, :damage, :loot, :shieldPower , :name 
        
    end

end
