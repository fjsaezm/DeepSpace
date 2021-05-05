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
public class Damage {
    private int nShields;
    private int nWeapons;
    private ArrayList<WeaponType> weapons;
    private static int NOTUSED = -1;
    
    public String toString(){
        return "Shields: " +this.nShields + " , nWeapons: " + this.nWeapons;
    }
    
    Damage(int w, int s){
        this.nShields = s;
        this.nWeapons = w;
        this.weapons = null;
    }
    
    Damage(ArrayList<WeaponType> wl, int s){
        this.nShields = s;
        this.nWeapons = NOTUSED;
        this.weapons = wl;
    }
    
    Damage(Damage d){
        this.nShields = d.getNShields();
        if(d.getWeapons() != null){
            this.weapons = d.getWeapons();
            this.nWeapons = NOTUSED;
        }
        else{
            this.weapons = null;
            this.nWeapons = d.getNWeapons();
        }
        
    }
    
    DamageToUI getUIversion(){
        return new DamageToUI(this);
    }
    
    private int arrayContainsType(ArrayList<Weapon> w, WeaponType t){
        
        int ret = -1;
        for(Weapon wep : w){
            if(wep.getType() == t){
                ret = w.indexOf(wep);
                break;
            }
        }
        return ret;
        
    }
    
    public Damage adjust(ArrayList<Weapon> w, ArrayList<ShieldBooster> s){
        
        if (this.weapons != null){
            // Vector to introduce the adjusted weapontypes
            ArrayList<WeaponType> newWeapons = new ArrayList<WeaponType>();
            // Copy of the old vector 
            ArrayList<Weapon> old = new ArrayList<Weapon>(w);

            int newShields = min(s.size(),this.nShields);

            for(WeaponType wType : this.weapons){
                
                int pos = arrayContainsType(old,wType);
                if(pos != -1){
                    newWeapons.add(wType);
                    old.remove(pos);
                }
                
            }
            Damage ret = new Damage(newWeapons,newShields);
            return ret;
        }
        else{
            int newShields = min(s.size(), this.nShields);
            int newWeapons = min(w.size(),this.nWeapons);
            
            return new Damage(newWeapons,newShields);
        }
        
    }
    
    public void discardWeapon(Weapon w){
        WeaponType t = w.getType();
        
        if(this.weapons ==  null){
            if(this.nWeapons > 0){
                this.nWeapons -=1;
            }
        }
        else{
            if(this.weapons.contains(t)){
                this.weapons.remove(t);
            }
        }
        
            
    }
    
    public void discardShieldBooster(){
        if(this.nShields > 0){
            this.nShields -= 1;
        }
    }
    
    public boolean hasNoEffect(){
        boolean ret = false;
        if(this.nWeapons == NOTUSED){
            ret = this.weapons.size() == 0 && this.nShields == 0;
        }
        else{
            ret = this.nShields == 0 && this.nWeapons == 0;
        }
        return ret;
    }

    public int getNShields() {
        return nShields;
    }

    public int getNWeapons() {
        return nWeapons;
    }

    public ArrayList<WeaponType> getWeapons() {
        return weapons;
    }
    
    
}
