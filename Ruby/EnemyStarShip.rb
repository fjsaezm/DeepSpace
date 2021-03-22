#encoding:utf-8

require_relative 'ShotResult'

module Deepspace

    class EnemyStarShip


        def initialize(name,ammoPower,shieldPower,loot,damage)
            @name = n
            @ammoPower = a
            @shieldPower = s
            @loot = loot
            @damage = damage
        end

        def protection
            @shieldPower
        end

        def fire
            @ammoPower
        end

        def receiveShot(shot)
            ret = ShotResult::DONOTRESIST
            if shot < @shieldPower
                ret = ShotResult::RESIST
            end
            ret
        end

        attr_reader :name, :damage, :ammoPower, :shieldPower , :loot



    end

end