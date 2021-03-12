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
class Weapon {
    private String name;
    private WeaponType type;
    private int uses;

    
    
    Weapon(String name, WeaponType type, int uses) {
        this.name = name;
        this.type = type;
        this.uses = uses;
    }
    
    Weapon(Weapon w) {
        this.name = w.name;
        this.type = w.type;
        this.uses = w.uses;
    }

    public WeaponType getType() {
        return type;
    }

    public int getUses() {
        return uses;
    }
    
    public float power(){
        return this.type.getPower();
    }
    
    public float useIt(){
        float ret = 1.0f;
        
        if(this.uses > 0){
            this.uses -= 1;
            ret = this.power();
        }
        
        return ret;
    }
    
    public String toString(){
        String s = String.format("This weapon has: name = %s , WeaponType = %h , uses = %d .", name,type,uses);
        return s;
    }
    
    WeaponToUI getUIVersion(){
        return new WeaponToUI(this);
    }
}
