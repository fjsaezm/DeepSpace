/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

import static java.lang.Integer.min;
import java.util.ArrayList;

/**
 *
 * @author fjsae
 */
public abstract class Damage {
    
    private int nShields;
    
    Damage(int nShields){
        this.nShields = nShields;
    }
    
    public int getNShields(){
        return this.nShields;
    }
    
    public abstract Damage copy();
    
    abstract DamageToUI getUIversion();
   
    public abstract void discardWeapon(Weapon w);
    
    public  boolean hasNoEffect(){
        return nShields == 0;
    }
    
    public void discardShieldBooster(){
        if(nShields > 0){
            nShields -=1;
        }
    }
    
    public abstract Damage adjust(ArrayList<Weapon> w, ArrayList<ShieldBooster> s);
    
    int adjustShields(int s){
        return min(s,nShields);
    }
    
    public String toString(){
        return "NShields : " + this.nShields;
    }



      
}
