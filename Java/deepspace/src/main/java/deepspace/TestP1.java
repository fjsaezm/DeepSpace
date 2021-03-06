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
public class TestP1 {
    
    public static void main(String args[]){
        
        
        Loot l = new Loot(1, 2, 3, 4, 5);
        SuppliesPackage supplies = new SuppliesPackage(7.0f, 6.0f, 4.0f);
        ShieldBooster booster = new ShieldBooster("Iron", 4f, 1);
        Weapon w = new Weapon("Gun", WeaponType.MISSILE, 0);
        Dice d = new Dice();
        
        System.out.format("\nType of weapon %s\n", w.getType());
        System.out.format("\nWeapon Usages: %d\n", w.getUses());
        System.out.format("\nWeapon Power: %f\n", w.power());
        
        System.out.format("\nShieldBoost: %f\n", booster.getBoost());
        System.out.format("\nUses: %d\n", booster.getUses());
        
        System.out.format("\nSupplies obtained: %d\n", l.getNSupplies());
        System.out.format("\nWeapons obtained: %d\n", l.getNWeapons());
        System.out.format("\nShields obtained: %d\n", l.getNShields());
        System.out.format("\nMedals obtained: %d\n", l.getNMedals());
        System.out.format("\nHangars obtained: %d\n", l.getNHangars());

        System.out.format("\nShield booster: %f\n", booster.getBoost());
        System.out.format("\nShield uses: %d\n", booster.getUses());
        
        System.out.format("\n Power of the weapon obtained in supplies: %f\n", supplies.getAmmoPower());
        System.out.format("\nPower of the shield obtained in supplies: %f\n", supplies.getShieldPower());
        System.out.format("\nFuel obtained in the supplies: %f\n", supplies.getFuelUnits());
        
        int nInitHangars = 0;
        int nInitWeapons3 = 0;
        int nInitWeapons2 = 0;
        int nInitWeapons1 = 0;
        int nInitShields = 0;
        int nFirstShotStarship = 0;
        int nMoves = 0;
        
        for(int i = 0; i < 100; i++){
            nInitHangars += d.initWithNHangars();
            int gen = d.initWithNWeapons();
            if(gen == 1){
                nInitWeapons1 +=1;
            }
            else if (gen == 2){
                nInitWeapons2 +=1;
            }
            else{
                nInitWeapons3 +=1;
            }
            
            nInitShields += d.initWithNShields();
            nFirstShotStarship += d.firstShot() == GameCharacter.SPACESTATION ? 1 : 0;
            nMoves += d.spaceStationMoves(0.5f) ? 1 : 0;
            
            
        }
        
        System.out.println("initWithNHangars " + nInitHangars + " (the average should be 75)");
        System.out.println("initWeapons3 " + nInitWeapons3 + " (the average should be 100-2*25 = 50)");
        System.out.println("initWeapons2 " + nInitWeapons2 + " (the average should be 25");
        System.out.println("initWeapons1 " + nInitWeapons1 + " (the average should be 25");
        System.out.println("initNShields " + nInitShields + " ( the average should be 75");
        System.out.println("nMoves " + nMoves + " (the average should be 50)");
        
    }
}
