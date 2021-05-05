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
public class Hangar {
    
    private int maxElements;
    private ArrayList<Weapon> weapons;
    private ArrayList<ShieldBooster> shieldBoosters;
    
    public String toString(){
        return "This hangar can store " + maxElements + ", and currently it has " + weapons.size() + " weapons and " + shieldBoosters.size() + " shieldBoosters";
    }
    
    Hangar(int capacity){
        this.maxElements = capacity;
        weapons = new ArrayList<Weapon>();
        shieldBoosters = new ArrayList<ShieldBooster>();
        
    }
    
    Hangar(Hangar h){
        this.maxElements = h.maxElements;
        this.weapons = new ArrayList(h.weapons);
        this.shieldBoosters = new ArrayList(h.shieldBoosters);
    }
    
    HangarToUI getUIversion(){
        return new HangarToUI(this);
    }
    
    private boolean spaceAvailable(){
        int count = this.weapons.size() + this.shieldBoosters.size();
        
        return count < this.maxElements;
        
    }
    
    public boolean addWeapon(Weapon w){
        boolean ret = false;
        if (this.spaceAvailable()){
            this.weapons.add(w);
            ret = true;
        }
       
        return ret;
    }
    
    public boolean addShieldBoosters(ShieldBooster s){
        boolean ret = false;
        if (this.spaceAvailable()){
            this.shieldBoosters.add(s);
            ret = true;
        }
       
        return ret;
    }

    public int getMaxElements() {
        return maxElements;
    }

    public ArrayList<Weapon> getWeapons() {
        return weapons;
    }

    public ArrayList<ShieldBooster> getShieldBoosters() {
        return shieldBoosters;
    }
    
    public ShieldBooster removeShieldBooster(int s){
        ShieldBooster ret = null;
        if( s >= 0 && s < this.shieldBoosters.size()){
            ret = this.shieldBoosters.get(s);
            this.shieldBoosters.remove(s);
        }
        
        return ret;
    }
    
    public Weapon removeWeapon(int w){
        Weapon ret = null;
        if( w >= 0 && w < this.weapons.size()){
            ret = this.weapons.get(w);
            this.weapons.remove(w);
        }
        
        return ret;
    }
}
