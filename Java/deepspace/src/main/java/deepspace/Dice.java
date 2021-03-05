/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

import java.util.Random;

/**
 *
 * @author fjaviersaezm
 */
class Dice {
    
    private final float HANGARPROBVALUE = 0.25f;
    private final float SHIELDPROBVALUE = 0.25f;
    private final float WEAPONPROBVALUE = 0.25f;
    private final float FIRSTSHOTPROBVALUE = 0.25f;
    
    private final float NHANGARSPROB;
    private final float NSHIELDSPROB;
    private final float NWEAPONSPROB;
    private final float FIRSTSHOTPROB;
    
    private Random generator;

    public Dice() {
        this.NHANGARSPROB = HANGARPROBVALUE;
        this.NSHIELDSPROB = SHIELDPROBVALUE;
        this.NWEAPONSPROB = WEAPONPROBVALUE;
        this.FIRSTSHOTPROB = FIRSTSHOTPROBVALUE;
        this.generator = new Random();
    }
    
    
}
