/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

import static java.lang.Float.max;
import static java.lang.Float.min;
import java.util.ArrayList;

/**
 *
 * @author fjsae
 */
public class SpaceStation {
    private static final float MAXFUEL = 100f;
    private static final float SHIELDLOSSPERUNITSHOT =0.1f;
    
    private float ammoPower;
    private float fuelUnits;
    private String name;
    private int nMedals;
    private float shieldPower;
    
    private ArrayList<Weapon> weapons;
    private ArrayList<ShieldBooster> shieldBoosters;
    private Hangar hangar; // this will be o or 1
    private Damage pendingDamage; // this will be 0 or 1
    
    public String toString(){
        String ret = String.format("This SpaceStation has (ammoPower,fuelUnits,name,nMedals,shieldPower)=(%f,%f,%s,%d,%f)",ammoPower,fuelUnits,name,nMedals,shieldPower);
        
        String weap = "\n+ WEAPONS MOUNTED: \n";
        if(weapons == null || weapons.isEmpty())
            weap += " Ninguna\n";
        else{
            for(Weapon w : weapons){
                weap += w.toString();
            }
        }
        
        String shB = "\n+ SHIELDBOOSTERS MOUNTED: \n";
        if(shieldBoosters == null || shieldBoosters.isEmpty())
            shB += " Ninguno\n";
        else{
            for(ShieldBooster sB : shieldBoosters){
                shB += sB.toString();
            }
        }
        
        String han = "\n* HANGAR: \n";
        if(hangar == null)
            han += " Ninguno\n";
        else
            han += hangar.toString();
        
         
        String pDam = "\n* PENDINGDAMAGE: \n";
        if(pendingDamage == null)
            pDam += " Ninguno\n";
        else
            pDam += pendingDamage.toString() + "\n";
                
        return ret + weap + shB + han + pDam;
                
    }
    
    private void assignFuelValue(float f){
        this.fuelUnits = min(f,MAXFUEL);
    }
    
    private void cleanPendingDamage(){
        if(this.pendingDamage.hasNoEffect()){
            this.pendingDamage = null;
        }
    }
    
    SpaceStation(String n, SuppliesPackage supplies){
        this.name = n;
        this.ammoPower = supplies.getAmmoPower();
        assignFuelValue(supplies.getFuelUnits());
        this.shieldPower = supplies.getShieldPower();
        this.weapons = new ArrayList<Weapon>();
        this.shieldBoosters = new ArrayList<ShieldBooster>();
        this.pendingDamage = null;
        this.hangar = null;
        
    }

    public float getAmmoPower() {
        return ammoPower;
    }

    public float getFuelUnits() {
        return fuelUnits;
    }

    public String getName() {
        return name;
    }

    public int getNMedals() {
        return nMedals;
    }

    public float getShieldPower() {
        return shieldPower;
    }

    public ArrayList<Weapon> getWeapons() {
        return weapons;
    }

    public ArrayList<ShieldBooster> getShieldBoosters() {
        return shieldBoosters;
    }

    public Hangar getHangar() {
        return hangar;
    }

    public Damage getPendingDamage() {
        return pendingDamage;
    }
    
    public SpaceStationToUI getUIversion(){
        return new SpaceStationToUI(this);
    }
    
    public float getSpeed(){
        return this.fuelUnits/MAXFUEL;
    }
    
    public void cleanUpMountedItems(){
        for(int i = 0; i < this.weapons.size(); i++){
            if(this.weapons.get(i).getUses() == 0){
                this.weapons.remove(i);
                i--;
            }
                
        }
        for(int i =0; i < this.shieldBoosters.size(); i++){
            if(this.shieldBoosters.get(i).getUses() == 0){
                this.shieldBoosters.remove(i);
                i--;
            }
        }
    }
    
    public void discardHangar(){
        this.hangar = null;
    }
    
    public void discardshieldBooster(int i){
        if(i >= 0 && i < this.shieldBoosters.size()){
            ShieldBooster s  = this.shieldBoosters.remove(i);
            if(this.pendingDamage != null){
                this.pendingDamage.discardShieldBooster();
                cleanPendingDamage();
            }
        }
    }
    
    public void discardShieldBoosterInHangar(int i){
        if(this.hangar != null){
            this.hangar.removeShieldBooster(i);
        }
    }
    
    public void discardWeapon(int i){
        if(i >= 0 && i < this.weapons.size()){
            Weapon w  = this.weapons.remove(i);
            if(this.pendingDamage != null){
                this.pendingDamage.discardWeapon(w);
                cleanPendingDamage();
            }
        }
    }
    
    
    public void discardWeaponInHangar(int i){
        if(this.hangar != null){
            this.hangar.removeWeapon(i);
        }
    }
    
    public float fire(){
        float factor = 1.0f;
        for(Weapon w: this.weapons){
            factor *= w.useIt();
        }
        return factor*this.ammoPower;
    }
    
    public float protection(){
        float factor = 1.0f;
        for(ShieldBooster s: this.shieldBoosters){
            factor *= s.useIt();
        }
        return factor*this.shieldPower;
    }
    
    
    public void mountShieldBooster(int i){
        ShieldBooster b = this.hangar.removeShieldBooster(i);
        if(b != null){
            this.shieldBoosters.add(b);
        }
    }
    
    public void mountWeapon(int i){
        Weapon w = this.hangar.removeWeapon(i);
        if(w != null){
            this.weapons.add(w);
        }
    }
    
    public void move(){
        this.fuelUnits = Float.max(this.fuelUnits - this.getSpeed(),0f);
    }
    

    public void receiveHangar(Hangar h){
        if(this.hangar == null){
            this.hangar = h;
        }
    }
    
    public boolean receiveShieldBooster(ShieldBooster s){
        boolean ret = false;
        if(this.hangar!= null){
            ret = hangar.addShieldBoosters(s);
        }
        return ret;
    }
    
    public ShotResult receiveShot(float shot){
        ShotResult ret = ShotResult.DONOTRESIST;
        if (this.protection() >= shot){
            this.shieldPower -= max(0.0f,this.SHIELDLOSSPERUNITSHOT*shot);
            ret = ShotResult.RESIST;
        }   
        else{
            this.shieldPower = 0.0f;
        }
        return ret;
    }
    
    public void receiveSupplies(SuppliesPackage s){
        this.ammoPower += s.getAmmoPower();
        this.shieldPower += s.getShieldPower();
        assignFuelValue(this.fuelUnits + s.getFuelUnits());
        
    }
    
    public boolean receiveWeapon(Weapon w){
        boolean ret = false;
        if(this.hangar!= null){
            ret = hangar.addWeapon(w);
        }
        return ret;
    }
    
    public void setLoot(Loot loot){
        CardDealer dealer = CardDealer.getInstance();
        
        if(loot.getNHangars() > 0){
            Hangar hangar = dealer.nextHangar();
            this.receiveHangar(hangar);
        }
        
        int elements = loot.getNSupplies();
        for(int i = 0; i < elements; i++){
            SuppliesPackage sup = dealer.nextSuppliesPackage();
            this.receiveSupplies(sup);
        }
        
        elements = loot.getNWeapons();
        for(int i = 0; i < elements; i++){
            Weapon weap = dealer.nextWeapon();
            this.receiveWeapon(weap);
        }
        
        elements = loot.getNShields();
        for(int i = 0; i < elements; i++){
            ShieldBooster sh = dealer.nextShieldBooster();
            this.receiveShieldBooster(sh);
        }
        
        this.nMedals += loot.getNMedals();
        
            
    }
    
    public void setPendingDamage(Damage d){
        Damage adjusted = d.adjust(this.weapons,this.shieldBoosters);
        if(adjusted.getNWeapons() == 0 && adjusted.getNShields() == 0){
            adjusted = null;
        }
        this.pendingDamage = adjusted;
    }
    
    public boolean validState(){
        boolean ret = true;
        if(this.pendingDamage != null){
            if(!this.pendingDamage.hasNoEffect()){
                ret = false;
            }
        }
        return ret;
    }
    
    
}
