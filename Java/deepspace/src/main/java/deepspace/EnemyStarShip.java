/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

/**
 *
 * @author fjsae
 */
public class EnemyStarShip {
    
    private float ammoPower;
    private String name;
    private float shieldPower;
    private Loot loot;

    public float getAmmoPower() {
        return ammoPower;
    }

    public String getName() {
        return name;
    }

    public float getShieldPower() {
        return shieldPower;
    }

    public Loot getLoot() {
        return loot;
    }

    EnemyStarShip(float ammoPower, String name, float shieldPower) {
        this.ammoPower = ammoPower;
        this.name = name;
        this.shieldPower = shieldPower;
    }
    
    EnemyStarShip(EnemyStarShip e){
        this.ammoPower = e.ammoPower;
        this.name = e.name;
        this.shieldPower = e.shieldPower;
        this.loot = e.loot;
        
    }
    
    public float fire(){
        return this.ammoPower;
    }
    
    public float protection(){
        return this.shieldPower;
    }
    
    public ShotResult receiveshot(float shot){
        ShotResult ret = ShotResult.RESIST;
        if(this.shieldPower < shot){
            ret  = ShotResult.DONOTRESIST;
        }
        return ret;
    }
    
    private EnemyToUI getUIVersion(){
        return new EnemyToUI(this);
    }
    
    
}
