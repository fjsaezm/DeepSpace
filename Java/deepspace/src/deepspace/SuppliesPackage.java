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
class SuppliesPackage {
 
    private float ammoPower;
    private float fuelUnits;
    private float shieldPower;
   

    SuppliesPackage(float ammoPower, float fuelUnits, float shieldPower) {
        this.ammoPower = ammoPower;
        this.fuelUnits = fuelUnits;
        this.shieldPower = shieldPower;
    }

    SuppliesPackage(SuppliesPackage p){
        this.ammoPower = p.getAmmoPower();
        this.fuelUnits = p.getFuelUnits();
        this.shieldPower = p.getFuelUnits();
    }
    
    public float getAmmoPower() {
        return ammoPower;
    }

    public float getFuelUnits() {
        return fuelUnits;
    }

    public float getShieldPower() {
        return shieldPower;
    }
    
    public String toString(){
        String s = String.format("This Supplies package has: ammoPower = %f , fuelUnits = %f , shieldPower = %f .", ammoPower, fuelUnits , shieldPower);
        return s;
    }
    
    
}
