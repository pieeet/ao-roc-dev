package jspcursus.eindtoets.natashaluyer;

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
        voegAutoToe(new Auto("audi", "a1", 23000));
        voegAutoToe(new Auto("audi", "a3", 23000));
        voegAutoToe(new Auto("audi", "r8", 123000));
        voegAutoToe(new Auto("ferrari", "enzo", 200000));
        voegAutoToe(new Auto("ferrari", "testarossa", 209000));
        voegAutoToe(new Auto("fiat", "500", 12000));
        voegAutoToe(new Auto("fiat", "bravo", 23000));
        voegAutoToe(new Auto("fiat", "punto", 16000));
        voegAutoToe(new Auto("ford", "fiesta", 14000));
        voegAutoToe(new Auto("ford", "focus", 25000));
        voegAutoToe(new Auto("ford", "mondeo", 28000));
        voegAutoToe(new Auto("maserati", "ghibli", 120000));
        voegAutoToe(new Auto("maserati", "quattroporte", 160000));
        voegAutoToe(new Auto("opel", "astra", 22000));
        voegAutoToe(new Auto("opel", "corsa", 14000));
        voegAutoToe(new Auto("opel", "mokka", 11000));
        voegAutoToe(new Auto("porsche", "cayenne", 85000));
        voegAutoToe(new Auto("porsche", "panamera", 120000));
        voegAutoToe(new Auto("porsche", "911", 126000));
    }
    
    public void voegAutoToe(Auto a) {
        autolijst.add(a);
    }
    
    public String zoekAutoOpPrijs(double min_prijs, double max_prijs) {
        String s = "<table><tr><th>Model</th><th>Prijs</th></tr>";
        for(Auto a : autolijst){
            if(a.getPrijs() > min_prijs && a.getPrijs() < max_prijs){
                s += "<tr><td><img src='images/" + a.getMerk() + "_" + a.getType()
                        + ".jpg'><br>Merk en model: " + a.getMerk() + " " + a.getType() + "</td><td>€ "
                        + a.getPrijs() + "</td></tr>";
            }
        }      
        s += "</table>";
        return s;
    }
    
     public String zoekAutoOpMerk(String merk) {
         String s = "<table><tr><th>Model</th><th>Prijs</th></tr>";
         for(Auto a : autolijst){
             if(a.getMerk().equals(merk)){
                 s += "<tr><td><img src='images/" + a.getMerk() + "_" + a.getType()
                        + ".jpg'><br>Merk en model: " + a.getMerk() + " " + a.getType() + "</td><td>€ "
                        + a.getPrijs() + "</td></tr>";
             }
         }
         s += "</table>";
         return s;
    }
     
     public String getAutolijst() {
         String s = "<table><tr><th>Model</th><th>Prijs</th></tr>";
         for(Auto a : autolijst){
             s += "<tr><td><img src='images/" + a.getMerk() + "_" + a.getType()
                        + ".jpg'><br>Merk en model: " + a.getMerk() + " " + a.getType() + "</td><td>€ "
                        + a.getPrijs() + "</td></tr>";
         }
         s += "</table>";
         return s;
    }
}
