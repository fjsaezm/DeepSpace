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
public class PowerEfficientSpaceStation extends SpaceStation {
    
    private static final float EFFICIENCYFACTOR = 1.10f;
    
    public PowerEfficientSpaceStation(SpaceStation station){
        super(station);
    }
    
    @Override
    public float fire(){
        return super.fire()*EFFICIENCYFACTOR;
    }
    
    @Override
    public float protection(){
        return super.protection()*EFFICIENCYFACTOR;
    }
    
    @Override
    public Transformation setLoot(Loot loot){
        
        
        Transformation t = super.setLoot(loot);
        if(t == Transformation.SPACECITY){
            t = Transformation.NOTRANSFORM;
        }
        
        return t;
        
            
    }
    
}
