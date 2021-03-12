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
    
    DamageToUI getUIVersion(){
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
        ArrayList<WeaponType> newWeapons = new ArrayList<WeaponType>();
        ArrayList<WeaponType> old = new ArrayList<WeaponType>(this.weapons);
        int newShields = min(s.size(),this.nShields);
        for(Weapon received : w){
            WeaponType t = received.getType();
            if(old.contains(t)){
                old.remove(t);
                newWeapons.add(t);
            }
        }
        return new Damage(newWeapons,newShields);
        
    }
    
    public void discardWeapon(Weapon w){
        WeaponType t = w.getType();
        if(this.weapons.contains(t)){
            this.weapons.remove(t);
        }
        else{
            if(this.nWeapons > 0){
                this.nWeapons -= 1;
            }
        }
    }
    
    public void discardShieldBooster(){
        if(this.nShields > 0){
            this.nShields -= 1;
        }
    }
    
    public boolean hasNoEffect(){
        return (this.nShields == 0)&& (this.nWeapons == 0) && (this.weapons.size() == 0);
    }

    public int getnShields() {
        return nShields;
    }

    public int getnWeapons() {
        return nWeapons;
    }

    public ArrayList<WeaponType> getWeapons() {
        return weapons;
    }
    
    
}
