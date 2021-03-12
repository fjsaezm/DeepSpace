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
        
    }
    
    CombatResult combat(SpaceStation station, EnemyStarShip enemy){
        
    }
    
    public void discardHangar(){
        
    }
    
    public void discardShieldBooster(){
        
    }
    
    public void discardShieldBoosterInHangar(int i){
        
    }
    
    public void discardWeapon(int i){
    }
    
    public void discardWeaponInhangar(int i){
        
    }
    
    public GameState getState(){
        return this.gameState;
    }
    
    public GameUniverseToUI getUIVersion(){
    }
    
    public boolean haveAWinner(){
        
    }
    
    public void init(ArrayList<String> names){
        
    }
    
    public void mountShieldBooster(int i){
        
    }
    
    public void mountWeapon(int i){
        
    }
    
    public boolean nextTurn(){
        
    }
}
