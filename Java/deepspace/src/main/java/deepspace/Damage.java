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
    
    public String toString(){
        return "Shields: " +this.nShields + " , nWeapons: " + this.nWeapons;
    }
    
    Damage(int w, int s){
        this.nShields = s;
        this.nWeapons = w;
        this.weapons = new ArrayList<WeaponType>();
    }
    
    Damage(ArrayList<WeaponType> wl, int s){
        this.nShields = s;
        this.nWeapons = wl.size();
        this.weapons = new ArrayList<WeaponType>(wl);
    }
    
    Damage(Damage d){
        this.nShields = d.nShields;
        this.nWeapons = d.nWeapons;
        this.weapons = new ArrayList<WeaponType>(d.weapons);
        
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
        
        if (this.weapons.size() > 0){
            // Vector to introduce the adjusted weapontypes
            ArrayList<WeaponType> newWeapons = new ArrayList<WeaponType>();
            // Copy of the old vector 
            ArrayList<Weapon> old = new ArrayList<Weapon>(w);

            int newShields = min(s.size(),this.nShields);

            for(WeaponType received : this.weapons){
                
                if(arrayContainsType(old,received)  != -1){
                    newWeapons.add(received);
                    old.remove(received);
                    
                }
            }
            return new Damage(newWeapons,newShields);
        }
        else{
            int newShields = min(s.size(), this.nShields);
            int newWeapons = min(w.size(),this.nWeapons);
            
            return new Damage(newWeapons,newShields);
        }
        
    }
    
    public void discardWeapon(Weapon w){
        WeaponType t = w.getType();
        
        if(this.weapons.contains(t))
            this.weapons.remove(t);
           
        if(this.nWeapons > 0)
                this.nWeapons -= 1;
            
    }
    
    public void discardShieldBooster(){
        if(this.nShields > 0){
            this.nShields -= 1;
        }
    }
    
    public boolean hasNoEffect(){
        return (this.nShields == 0)&& (this.nWeapons == 0) && (this.weapons.size() == 0);
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
