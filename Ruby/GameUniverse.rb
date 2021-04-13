#encoding:utf-8

require_relative 'Dice'
require_relative 'GameStateController'
require_relative 'SpaceStation'
require_relative 'CombatResult'
require_relative 'GameCharacter'
require_relative 'ShotResult'


module Deepspace

    class GameUniverse

        @@WIN = 10

        def initialize()
            @currentStationIndex = 0
            @turns = 0
            @gameState = GameStateController.new
            @dice = Dice.new
            @currentStation = nil
            @currentEnemy = nil
            @spaceStations = Array.new
            
        end

        def haveAWinner
            @currentStation.nMedals == @@WIN
        end

        def discardHangar
            @currentStation.discardHangar
        end

        def discardShieldBooster(i)
            @currentStation.discardShieldBooster(i)
        end

        def discardShieldBoosterInHangar(i)
            @currentStation.discardShieldBoosterInHangar(i)
        end

        def discardWeapon(i)
            @currentStation.discardWeapon(i)
        end

        def discardWeaponInHangar(i)
            @currentStation.discardWeaponInHangar(i)
        end

        def init(names)
            # Next practise
            state = gameState.getState

            if state == GameState::CANNOTPLAY
                dealer = CardDealer.getInstance

                names.each do |n|
                    supplies = dealer.nextSuppliesPackage
                    station = SpaceStation.new(n,supplies)
                    @spaceStations << station
                    nh = @dice.initWithNHangars
                    nw = @dice.initWithNWeapons
                    ns = @dice.initWithNShields
                    lo = Loot.new(0,nw,ns,nh,0)
                    station.setLoot(lo)
                end

                @currentStationIndex = @dice.whoStarts(names.length)
                @currentStation = @spaceStations[@currentStationIndex]
                @currentEnemy = dealer.nextEnemy
                @gameState.next(@turns,@spaceStations.length)
            end
        end

        def nextTurn
            state = @gameState
            ret = False
            if state == GameState::AFTERCOMBAT
                if @currentStation.validState
                    @currentStationIndex = (@currentStationIndex+1) % @spaceStations.length
                    @turns += 1
                    @currentStation = @spaceStations[@currentStationIndex]
                    dealer = CardDealer.getInstance
                    @currentEnemy = dealer.nextEnemy
                    @gameState.next(@turns,@spaceStations.lenght)
                    ret = true
                end
            end

            ret
        end

        def combat
            # Next Practise
        end

        def combatGo(station,enemy)
            # Next practise
        end
        
        def getState
            @gameState
        end

        def getUIversion
            GameUniverseToUI.new(self)
        end

    end

end
