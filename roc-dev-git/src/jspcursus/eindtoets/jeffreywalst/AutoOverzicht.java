package jspcursus.eindtoets.jeffreywalst;

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
        
    autolijst.add(new Auto("Audi", "A1", 23000));
    autolijst.add(new Auto("Audi", "A3", 23000));
    autolijst.add(new Auto("Audi", "R8", 123000));
    autolijst.add(new Auto("Ferrari", "Enzo", 200000));
    autolijst.add(new Auto("Ferrari", "Testarossa", 209000));
    autolijst.add(new Auto("Fiat", "500", 12000));
    autolijst.add(new Auto("Fiat", "Bravo", 23000));
    autolijst.add(new Auto("Fiat", "Punto", 16000));
    autolijst.add(new Auto("Ford", "Fiesta", 14000));
    autolijst.add(new Auto("Ford", "Focus", 25000));
    autolijst.add(new Auto("Ford", "Mondeo", 28000));
    autolijst.add(new Auto("Maserati", "Ghibli", 120000));
    autolijst.add(new Auto("Maserati", "Quattroporte", 160000));
    autolijst.add(new Auto("Opel", "Astra", 22000));
    autolijst.add(new Auto("Opel", "Corsa", 14000));
    autolijst.add(new Auto("Opel", "Mokka", 11000));
    autolijst.add(new Auto("Porsche", "Cayenne", 85000));
    autolijst.add(new Auto("Porsche", "Panamera", 120000));
    autolijst.add(new Auto("Porsche", "911", 126000));
    }
    
    
    public String zoekAutoOpPrijs(int min_prijs, int max_prijs) {
               
        String s="";
         
         for(Auto a:autolijst){
         if( a.getPrijs()>=min_prijs && a.getPrijs()<=max_prijs){
           s +="<tr>";
           s +="<td>"+a.getPlaatjes()+"</br>"+a.getMerk()+" "+a.getType()+"<p></td>";
           s +="<td>"+"€"+a.getPrijs()+"</td>";
           s +="</tr>";   
             }   
         }
         return s;  
    }
    
     public String zoekAutoOpMerk(String merk) {
         String s="";
         
         for(Auto a:autolijst){
         if(a.getMerk().equals(merk)){
             s +="<tr>";
           s +="<td>"+a.getPlaatjes()+"</br>"+a.getMerk()+" "+a.getType()+"<p></td>";
           s +="<td>"+"€"+a.getPrijs()+"</td>";
           s +="</tr>";    
             }    
         }
         
         return s;
    }
     
     public String getAutolijst() {
         String s="";
         
         for(Auto a:autolijst){
           s +="<tr>";
           s +="<td>"+a.getPlaatjes()+"</br>"+a.getMerk()+" "+a.getType()+"<p></td>";
           s +="<td>"+"€"+a.getPrijs()+"</td>";
           s +="</tr>";
         }
        return s;
  
    }
}
