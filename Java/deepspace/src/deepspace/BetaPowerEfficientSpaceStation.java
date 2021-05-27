/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

/**
 *
 * @author fjsae
 */
public class BetaPowerEfficientSpaceStation extends PowerEfficientSpaceStation{
    private static final float EXTRAEFFICIENCY = 1.2f;
    private Dice dice;
    
    public BetaPowerEfficientSpaceStation(SpaceStation station){
        super(station);   
    }
    
    @Override
    public float fire(){
        float f = super.fire();
        if(dice.extraEfficiency()){
            f *= EXTRAEFFICIENCY;
        }
        
        return f;
    }
}
