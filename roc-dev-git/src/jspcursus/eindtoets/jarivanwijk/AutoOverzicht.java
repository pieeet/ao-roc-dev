package jspcursus.eindtoets.jarivanwijk;

import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author janjaap
 */
public class AutoOverzicht {
    private ArrayList<Auto> autolijst;
    
    public AutoOverzicht() {
        autolijst = new ArrayList<Auto>(); 
    }
    
    public void voegAutoToe(Auto a) {
  
        autolijst.add(a);
 
    }
    
    
    public ArrayList<Auto> zoekAutoOpPrijs(int min_prijs, int max_prijs) {
        
        ArrayList<Auto> autolijst = new ArrayList<Auto>();  //niet handig om zelfde naam te gebruiken als attribuut
        
        for(Auto a : this.autolijst){
            if(a.getPrijs() >= min_prijs && a.getPrijs() <= max_prijs){
                autolijst.add(a);
            }
        }
        
        return autolijst;
        
    }
    
     public ArrayList<Auto> zoekAutoOpMerk(String merk) {
  
        ArrayList<Auto> autolijst = new ArrayList<Auto>();
        
        for(Auto a : this.autolijst){
            if(a.getMerk().equals(merk)){
                autolijst.add(a);
            }
        }
        
        return autolijst;
  
    }
     
     public ArrayList<Auto> getAutolijst() {
  
        return autolijst;
  
    }
}
