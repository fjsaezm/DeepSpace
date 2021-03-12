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
class ShieldBooster {
    private String name;
    private float boost;
    private int uses;
    
    

    ShieldBooster(String name, float boost, int uses) {
        this.name = name;
        this.boost = boost;
        this.uses = uses;
    }
    
    ShieldBooster(ShieldBooster s) {
        this.name = s.name;
        this.boost = s.boost;
        this.uses = s.uses;
    }

    public float getBoost() {
        return boost;
    }

    public int getUses() {
        return uses;
    }
    
    public float useIt(){
        float ret = 1.0f;
        
        if(this.uses > 0){
            this.uses -= 1;
            ret = this.boost;
        }
        
        return ret;
    }
    
    public String toString(){
        String s = String.format("This ShieldBooster has: name = %s , boost = %f , uses = %d .", name,boost,uses);
        return s;
    }
    
    ShieldToUI getUIVersion(){
        return new ShieldToUI(this);
    }
}
