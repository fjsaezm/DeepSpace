/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

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
    
    
    private void assignFuelValue(float f){
        this.fuelUnits = min(f,MAXFUEL);
    }
    
    private void cleanPendingDamage(){
        if(this.pendingDamage.hasNoEffect()){
            this.pendingDamage = null;
        }
    }
    
    SpaceStation(String n, SuppliesPackage supplies){
        this.name = name;
        this.ammoPower = supplies.getAmmoPower();
        this.fuelUnits = supplies.getFuelUnits();
        this.shieldPower = supplies.getShieldPower();
        
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

    public int getnMedals() {
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
    
    public SpaceStationToUI getUIVersion(){
        return new SpaceStationToUI(this);
    }
    
    public float getSpeed(){
        return this.fuelUnits/MAXFUEL;
    }
    
    public void cleanUpMountedItems(){
        
    }
    
    public void discardHangar(){
        
    }
    
    public void discardshieldBooster(int i){
        
    }
    
    public void discardShieldBoosterInHangar(int i){
        
    }
    
    public void discardWeapon(int i){
        
    }
    
    
    public void discardWeaponInHangar(int i){
        
    }
    
    public float fire(){
        
    }
    
    public void mountShieldBooster(int i){
        
    }
    
    public void mountWeapon(int i){
        
    }
    
    public void move(){
        this.fuelUnits = min(this.fuelUnits - this.getSpeed(),0f);
    }
    
    public float protection(){
        
    }
    
    public void receiveHangar(Hangar h){
        
    }
    
    public boolean receiveShieldBoosters(ShieldBooster s){
        
    }
    
    public ShotResult receiveShot(float shot){
        
    }
    
    public void receiveSupplies(SuppliesPackage s){
        
    }
    
    public boolean receiveWeapon(Weapon w){
        
    }
    
    public void setLoot(Loot loot){
        
    }
    
    public void setPendingDamage(Damage d){
        
    }
    
    public boolean validState(){
        
    }
    
    
}
