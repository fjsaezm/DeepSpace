/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

/**
 *
 * @author fjaviersaezm
 */
class Loot {
    private int nSupplies;
    private int nWeapons;
    private int nShields;
    private int nHangars;
    private int nMedals;
    private boolean getEfficient;
    private boolean spaceCity;
   
    
    Loot (int nSupplies,int nWeapons,int nShields,int nHangars,int nMedals){
        this.nSupplies = nSupplies;
        this.nWeapons = nWeapons;
        this.nShields = nShields;
        this.nHangars = nHangars;
        this.nMedals = nMedals;
        this.getEfficient = false;
        this.spaceCity = false;
        
    }
    
    Loot (int nSupplies,int nWeapons,int nShields,int nHangars,int nMedals,boolean getEfficient,  boolean city){
        this.nSupplies = nSupplies;
        this.nWeapons = nWeapons;
        this.nShields = nShields;
        this.nHangars = nHangars;
        this.nMedals = nMedals;
        this.getEfficient = getEfficient;
        this.spaceCity = city;
        
    }
    
    public int getNSupplies() {
        return nSupplies;
    }

    public int getNWeapons() {
        return nWeapons;
    }

    public int getNShields() {
        return nShields;
    }

    public int getNHangars() {
        return nHangars;
    }

    public int getNMedals() {
        return nMedals;
    }
    
    public String toString(){
        String s = String.format("This loot has: nSupplies = %d , nWeapons = %d , nShields = %d , nHangars = %d , nMedals = %d .", nSupplies,nWeapons,nShields,nHangars,nMedals);
        return s;
    }
    
    LootToUI getUIversion(){
        return new LootToUI(this);
    }
    
    public boolean getEfficient(){
        return getEfficient;
    }
    
    public boolean spaceCity(){
        return spaceCity;
    }
}
