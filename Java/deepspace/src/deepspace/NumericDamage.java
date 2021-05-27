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
public class NumericDamage extends Damage {
    
    private int nWeapons;
    
    NumericDamage(int n,int s){
        super(s);
        this.nWeapons = n;
    }
    
  
    
    public String toString(){
        return super.toString() + " , nWeapons: " + this.nWeapons;
    }
    
    public NumericDamage adjust(ArrayList<Weapon> w, ArrayList<ShieldBooster> s){
        int newShields = super.adjustShields(s.size());
        int newWeapons = min(w.size(),this.nWeapons);
        return new NumericDamage(newWeapons,newShields);
    }
    
    public void discardWeapon(Weapon w){
        if(this.nWeapons > 0){
            this.nWeapons -= 1;
        }
    }
    
    public boolean hasNoEffect(){
        return super.hasNoEffect() && this.nWeapons == 0;
    }
    

    public int getNWeapons() {
        return nWeapons;
    }
    
    NumericDamageToUI getUIversion(){
        return new NumericDamageToUI(this);
    }
    
    @Override
    public NumericDamage copy(){
        return new NumericDamage(this.nWeapons,this.getNShields());
    }
}
