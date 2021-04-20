/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

import java.util.ArrayList;

/**
 *
 * @author fjsae
 */
public class GameUniverse {
    
    private static final int WIN = 10;
    private int currentStationIndex;
    private int turns;
    
    private Dice dice;
    
    private EnemyStarShip currentEnemy;
    private ArrayList<SpaceStation> spaceStations;
    private SpaceStation currentStation;
    private GameStateController gameState;
    
    public String toString(){
        return "In this universe, we have: turns=" + turns + ", currentStationIndex="+currentStationIndex + ", the dice is:" + dice.toString() + 
                ", the enemy is:" + currentEnemy.toString() + ", the current spaceStation is:" + currentStation.toString() ;
    }
    
    
    GameUniverse(){
        this.gameState = new GameStateController();
        this.dice = new Dice();
        this.turns = 0;
    }
    
    
    
    CombatResult combat(SpaceStation station, EnemyStarShip enemy){
        GameCharacter ch = this.dice.firstShot();
        CombatResult combatResult = CombatResult.NOCOMBAT;
        boolean enemyWins = false;
        // Enemy First
        if(ch == GameCharacter.ENEMYSTARSHIP){
            float fire = enemy.fire();
            ShotResult result = station.receiveShot(fire);
            // If player resists, counterattack
            if(result == ShotResult.RESIST){
                fire = station.fire();
                result = station.receiveShot(fire);
                enemyWins = (result == ShotResult.RESIST);
            }
            else{
                enemyWins = true;
            }
        }
        // Player first
        else{
            float fire = station.fire();
            ShotResult result = enemy.receiveshot(fire);
            enemyWins = (result == ShotResult.RESIST);
            
        }
        
        // After the shots, move and set the loot/damage following the result
        if(enemyWins){
            float s = station.getSpeed();
            boolean moves = dice.spaceStationMoves(s);
            
            if(!moves){
                Damage damage = enemy.getDamage();
                station.setPendingDamage(damage);
                combatResult = CombatResult.ENEMYWINS;
            }
            else{
                station.move();
                combatResult = CombatResult.STATIONESCAPES;
            }
        }
        else{
            Loot aLoot = enemy.getLoot();
            station.setLoot(aLoot);
            combatResult = CombatResult.STATIONWINS;
        }
        
        gameState.next(turns, spaceStations.size());
        return combatResult;
    }
    
    public GameState getState(){
        return this.gameState.getState();
    }
    
    public CombatResult combat(){
        GameState state = this.gameState.getState();
        CombatResult combatResult = CombatResult.NOCOMBAT;
        if(state == GameState.BEFORECOMBAT || state == GameState.INIT){
            combatResult = combat(currentStation,currentEnemy);
        }
        return combatResult;
    }
    
    public void discardHangar(){
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            this.currentStation.discardHangar();
        }
    }
    
    public void discardShieldBooster(int i){
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            this.currentStation.discardshieldBooster(i);
        }
    }
    
    public void discardShieldBoosterInHangar(int i){
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            this.currentStation.discardShieldBoosterInHangar(i);
        }
    }
    
    public void discardWeapon(int i){
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            this.currentStation.discardWeapon(i);
        }
    }
    
    public void discardWeaponInHangar(int i){
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            this.currentStation.discardWeaponInHangar(i);
        }
    }
    
    public GameUniverseToUI getUIversion(){
        return new GameUniverseToUI(this.currentStation,this.currentEnemy);
    }
    
    public boolean haveAWinner(){
        boolean ret = false;
        if (currentStation.getNMedals() >= WIN){
            ret = true;
        }
        return ret;
    }
    
    public void init(ArrayList<String> names){
        GameState state = this.gameState.getState();
        
        if(state == GameState.CANNOTPLAY){
            this.spaceStations = new ArrayList<SpaceStation>();
            CardDealer dealer = CardDealer.getInstance();
            for(String n : names){
                SuppliesPackage supplies = dealer.nextSuppliesPackage();
                SpaceStation station = new SpaceStation(n,supplies);
                this.spaceStations.add(station);
                // Obtain initial things for station
                int nh = dice.initWithNHangars();
                int nw = dice.initWithNWeapons();
                int ns = dice.initWithNShields();
                Loot lo = new Loot(0,nw,ns,nh,0);
                station.setLoot(lo);
                
                
            }
            
            this.currentStationIndex = dice.whoStarts(names.size());
            this.currentStation = this.spaceStations.get(currentStationIndex);
            this.currentEnemy = dealer.nextEnemy();
            this.gameState.next(turns, spaceStations.size());
            
        }
    }
    
    public void mountShieldBooster(int i){
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            currentStation.mountShieldBooster(i);
        }
    }
    
    public void mountWeapon(int i){
        
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            currentStation.mountWeapon(i);
        }
    }
    
   public boolean nextTurn(){
       boolean ret = false;
       GameState state = gameState.getState();
       if(state == GameState.AFTERCOMBAT){
           if(currentStation.validState()){
               // Update variables
               this.currentStationIndex = (this.currentStationIndex+1)%spaceStations.size();
               this.turns++;
               this.currentStation = spaceStations.get(currentStationIndex);
               this.currentStation.cleanUpMountedItems();
               CardDealer dealer = CardDealer.getInstance();
               this.currentEnemy = dealer.nextEnemy();
               
               this.gameState.next(turns,spaceStations.size());
               ret = true;
               
           }
       }
       
       return ret;
    }
   
  
   
   
}
