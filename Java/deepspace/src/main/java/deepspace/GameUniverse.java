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
    private SpaceStation currentSpaceStation;
    private GameStateController gameState;
    
    GameUniverse(){
        this.gameState = new GameStateController();
        this.dice = new Dice();
        this.turns = 0;
    }
    
    
    
    /*CombatResult combat(SpaceStation station, EnemyStarShip enemy){
        
    }
    
    public CombatResult combat(){
        
    }*/
    
    public void discardHangar(){
        this.currentSpaceStation.discardHangar();
    }
    
    public void discardShieldBooster(int i){
        this.currentSpaceStation.discardshieldBooster(i);
    }
    
    public void discardShieldBoosterInHangar(int i){
        this.currentSpaceStation.discardShieldBoosterInHangar(i);
    }
    
    public void discardWeapon(int i){
        this.currentSpaceStation.discardWeapon(i);
    }
    
    public void discardWeaponInhangar(int i){
        this.currentSpaceStation.discardWeaponInHangar(i);
    }
    
    /*public GameState getState(){
        return this.gameState;
    }*/
    
    /*public GameUniverseToUI getUIVersion(){
        return new GameUniverseToUI(this);
    }*/
    
    public boolean haveAWinner(){
        boolean ret = false;
        if (currentSpaceStation.getNMedals() >= WIN){
            ret = true;
        }
        return ret;
    }
    
    /*public void init(ArrayList<String> names){
        
    }*/
    
    public void mountShieldBooster(int i){
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            currentSpaceStation.mountShieldBooster(i);
        }
    }
    
    public void mountWeapon(int i){
        
        if(gameState.getState() == GameState.INIT || gameState.getState() == GameState.AFTERCOMBAT){
            currentSpaceStation.mountWeapon(i);
        }
    }
    
   /*public boolean nextTurn(){
        
    }*/
}
