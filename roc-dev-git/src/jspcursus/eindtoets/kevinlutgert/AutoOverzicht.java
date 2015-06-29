package jspcursus.eindtoets.kevinlutgert;

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
    private ArrayList<Auto> lijst;
    
    public AutoOverzicht() {
        lijst = new ArrayList<Auto>(); 
        
    lijst.add(new Auto("audi", "a1", 23000));
    lijst.add(new Auto("audi", "a3", 23000));
    lijst.add(new Auto("audi", "r8", 123000));
    lijst.add(new Auto("ferrari", "enzo", 200000));
    lijst.add(new Auto("ferrari", "testarossa", 209000));
    lijst.add(new Auto("fiat", "500", 12000));
    lijst.add(new Auto("fiat", "bravo", 23000));
    lijst.add(new Auto("fiat", "punto", 16000));
    lijst.add(new Auto("ford", "fiesta", 14000));
    lijst.add(new Auto("ford", "focus", 25000));
    lijst.add(new Auto("ford", "mondeo", 28000));
    lijst.add(new Auto("maserati", "ghibli", 120000));
    lijst.add(new Auto("maserati", "quattroporte", 160000));
    lijst.add(new Auto("opel", "astra", 22000));
    lijst.add(new Auto("opel", "corsa", 14000));
    lijst.add(new Auto("opel", "mokka", 11000));
    lijst.add(new Auto("porsche", "cayenne", 85000));
    lijst.add(new Auto("porsche", "panamera", 120000));
    lijst.add(new Auto("porsche", "911", 126000));
    }
    
   public String GetMerk(String autotje){
       
       String s = "";
     for(Auto a : lijst){
         if(a.getMerk().equals(autotje)){
             
              s+= "<tr>";
             s+= "<td class='td'>"+a.getImage()+"</br>"+a.getMerk()+" "+a.getType()+"</td>";
             s+= "<td class='td'>€"+a.getPrijs()+"</td>";
             s+= "</tr>";
         }
     }
       
       return s;    
 
   }
    public String GetMax(int prijsmax,int prijsmin){
        String s = "";
        for(Auto a : lijst){
            if(a.getPrijs() > prijsmax && a.getPrijs() < prijsmin){
              s+= "<tr>";
             s+= "<td class='td'>"+a.getImage()+"</br>"+a.getMerk()+" "+a.getType()+"</td>";
             s+= "<td class='td'>€"+a.getPrijs()+"</td>";
             s+= "</tr>";
            }
        }
        return s;
    }
       

}
