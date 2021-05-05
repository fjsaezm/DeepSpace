#encoding:utf-8

require_relative 'Dice'
require_relative 'GameStateController'
require_relative 'SpaceStation'
require_relative 'CombatResult'
require_relative 'GameCharacter'
require_relative 'ShotResult'
require_relative 'GameUniverseToUI'



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

        def to_s
            out = "CurrentStationIndex = #{@currentStationIndex}\n"
            out += "Turns = #{@turns}\n"
            out += "GameState = #{state()}\n"
            out += " Current Enemy: \n #{@currentEnemy} \n"
            out += "Dice= #{@dice}\n"
            out += "Space Stations: \n"
            @spaceStations.each do |sp|
                out += " #{sp}\n"
            end
            out
        end

        def haveAWinner
            @currentStation.nMedals >= @@WIN
        end

        def discardHangar
            if state() == GameState::INIT or state() == GameState::AFTERCOMBAT
                @currentStation.discardHangar
            end
        end

        def discardShieldBooster(i)
            if state() == GameState::INIT or state() == GameState::AFTERCOMBAT
                @currentStation.discardShieldBooster(i)
            end
        end

        def discardShieldBoosterInHangar(i)
            if state() == GameState::INIT or state() == GameState::AFTERCOMBAT
                @currentStation.discardShieldBoosterInHangar(i)
            end
        end

        def discardWeapon(i)
            if state() == GameState::INIT or state() == GameState::AFTERCOMBAT
                @currentStation.discardWeapon(i)
            end
        end

        def discardWeaponInHangar(i)
            if state() == GameState::INIT or state() == GameState::AFTERCOMBAT
                @currentStation.discardWeaponInHangar(i)
            end
        end

        def mountWeapon(i)
            if state() == GameState::INIT or state() == GameState::AFTERCOMBAT
                @currentStation.mountWeapon(i)
            end
        end

        def mountShieldBooster(i)
            if state() == GameState::INIT or state() == GameState::AFTERCOMBAT
                @currentStation.mountShieldBooster(i)
            end
        end

        def init(names)

            if state() == GameState::CANNOTPLAY
                dealer = CardDealer.instance 

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
            state = state()
            ret = false
            if state == GameState::AFTERCOMBAT
                if @currentStation.validState
                    @currentStationIndex = (@currentStationIndex+1) % @spaceStations.length
                    @turns += 1
                    @currentStation = @spaceStations[@currentStationIndex]
                    @currentStation.cleanUpMountedItems
                    dealer = CardDealer.instance 
                    @currentEnemy = dealer.nextEnemy
                    @gameState.next(@turns,@spaceStations.length)
                    ret = true
                end
            end

            ret
        end

        def combat
            if state() == GameState::BEFORECOMBAT or state() == GameState::INIT
                ret = combatGo(@currentStation,@currentEnemy)
            else
                ret =CombatResult::NOCOMBAT
            end
            ret
        end

        def combatGo(station,enemy)
            ch = @dice.firstShot
            #puts "Va a disparar #{ch}"
            if ch == GameCharacter::ENEMYSTARSHIP
                fire = enemy.fire
                result = station.receiveShot(fire)
                if result == ShotResult::RESIST
                    
                    fire = station.fire()
                    #puts "La estación ha aguantado y ahora dispara con #{fire}"
                    result = enemy.receiveShot(fire)
                    enemyWins = result == ShotResult::RESIST
                else
                    #puts "La estación se ha derrumbado"
                    enemyWins = true
                end
            
            else
                fire = station.fire
                result = enemy.receiveShot(fire)
                #puts "Disparó la nave amiga y el resultado fue #{result}"
                enemyWins = result == ShotResult::RESIST
            end

            if enemyWins
                #puts "Ha ganado el enemigo"
                s = station.speed
                moves = @dice.spaceStationMoves(s)
                if !moves
                    #puts "No te has movido"
                    damage = enemy.damage
                    station.setPendingDamage(damage)
                    combatResult = CombatResult::ENEMYWINS
                else
                    #puts "Te moviste y te escapas del daño"
                    station.move
                    combatResult = CombatResult::STATIONESCAPES
                end
            else
                #puts "Has ganado, vas a poner el loot"
                aLoot = enemy.loot 
                station.setLoot(aLoot)
                combatResult = CombatResult::STATIONWINS
            end
            @gameState.next(@turns,@spaceStations.length)
            combatResult
        end
        
        def state
            @gameState.state
        end

        def getUIversion
            GameUniverseToUI.new(@currentStation,@currentEnemy)
        end

    end

end
