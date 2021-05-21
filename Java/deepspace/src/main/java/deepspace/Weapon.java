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
class Weapon implements CombatElement {
    private String name;
    private WeaponType type;
    private int uses;

    
    
    Weapon(String name, WeaponType type, int uses) {
        this.name = name;
        this.type = type;
        this.uses = uses;
    }
    
    Weapon(Weapon w) {
        this(w.name,w.type,w.uses);
    }

    public WeaponType getType() {
        return type;
    }

    @Override
    public int getUses() {
        return uses;
    }
    
    public float power(){
        return this.type.getPower();
    }
    
    @Override
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
    
    WeaponToUI getUIversion(){
        return new WeaponToUI(this);
    }
}
