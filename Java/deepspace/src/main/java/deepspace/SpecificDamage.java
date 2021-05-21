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
public class SpecificDamage extends Damage{
       
    private ArrayList<WeaponType> weapons;
    
    SpecificDamage(ArrayList<WeaponType> wl, int s){
        super(s);
        this.weapons = wl;
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
    
    public SpecificDamage adjust(ArrayList<Weapon> w, ArrayList<ShieldBooster> s){
         // Vector to introduce the adjusted weapontypes
            ArrayList<WeaponType> newWeapons = new ArrayList<WeaponType>();
            // Copy of the old vector 
            ArrayList<Weapon> old = new ArrayList<Weapon>(w);

            int newShields = super.adjustShields(s.size());

            for(WeaponType wType : this.weapons){
                
                int pos = arrayContainsType(old,wType);
                if(pos != -1){
                    newWeapons.add(wType);
                    old.remove(pos);
                }
                
            }
            return new SpecificDamage(newWeapons,newShields);

    }
    
    public void discardWeapon(Weapon w){
        WeaponType t = w.getType();
        if(this.weapons.contains(t)){
                this.weapons.remove(t);
        }
    }
    
    public boolean hasNoEffect(){
        return this.weapons.size() == 0 && super.hasNoEffect();
    }
    
    public ArrayList<WeaponType> getWeapons() {
        return weapons;
    }
    
    SpecificDamageToUI getUIversion(){
        return new SpecificDamageToUI(this);
    }
    
    @Override
    public String toString(){
        String s = super.toString();
        s += "\n \t Types:\n";
        for(WeaponType t: this.weapons){
            s+= "\t \t - " +t.toString() + "\n";
        }
        
        return s;
           
    }
    
    
    public SpecificDamage copy(){
        
        ArrayList<WeaponType> new_vec =  new ArrayList<WeaponType>();
        for(WeaponType w : this.weapons){
            new_vec.add(w);
        }
        return new SpecificDamage(new_vec,this.getNShields());
    }
}
