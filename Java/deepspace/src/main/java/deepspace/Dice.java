/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

import java.util.Random;

/**
 *
 * @author fjaviersaezm
 */
class Dice {
    
    // Avoiding "magic numbers"
    private static final float HANGARPROBVALUE = 0.25f;
    private static final float SHIELDPROBVALUE = 0.25f;
    private static final float WEAPONPROBVALUE = 0.33f;
    private static final float FIRSTSHOTPROBVALUE = 0.5f;
    
    private final float NHANGARSPROB;
    private final float NSHIELDSPROB;
    private final float NWEAPONSPROB;
    private final float FIRSTSHOTPROB;
    
    private Random generator;

    public Dice() {
        this.NHANGARSPROB = HANGARPROBVALUE;
        this.NSHIELDSPROB = SHIELDPROBVALUE;
        this.NWEAPONSPROB = WEAPONPROBVALUE;
        this.FIRSTSHOTPROB = FIRSTSHOTPROBVALUE;
        this.generator = new Random();
    }
    
    int initWithNHangars(){
        int ret = 1;
        float rand = this.generator.nextFloat();
        if (rand < NHANGARSPROB){
            ret = 0;
        }
        return ret;
    }
    
    int initWithNWeapons(){
        int ret = 3;
        float rand = this.generator.nextFloat();
        if (rand < NWEAPONSPROB){
            ret = 1;
        }
        else if (NWEAPONSPROB < rand && rand < 2*NWEAPONSPROB ){
            ret = 2;
        }
        
        return ret;
    }
    
    int initWithNShields(){
        int ret = 1;
        float rand = this.generator.nextFloat();
        if (rand < NSHIELDSPROB){
            ret = 0;
        }
        return ret;
    }
    
     int whoStarts(int nPlayers){
        return this.generator.nextInt(nPlayers);
    }
    
    GameCharacter firstShot(){
        GameCharacter ret = GameCharacter.ENEMYSTARSHIP;
        float rand = this.generator.nextFloat();
        if (rand < FIRSTSHOTPROB){
            ret = GameCharacter.SPACESTATION;
        }
        return ret;
        
    }
    
    boolean spaceStationMoves(float speed){
        boolean ret = false;
        float rand = this.generator.nextFloat();
        if (rand < speed){
            ret = true;
        }
        return ret;
             
    }
    
    
    public String toString(){
        String s = "This dice has: NHANGARSPROB = " + NHANGARSPROB + " , NSHIELDSPROB = " + NSHIELDSPROB + " , NWEAPONSPROB = " + NWEAPONSPROB + " , FIRSTSHOTPROB = " + FIRSTSHOTPROB;
        return s;
    }
        
    
    
}
