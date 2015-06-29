package jspcursus.eindtoets.jeshakuizenga;

import java.util.ArrayList;


public class AutoOverzicht {
    private final ArrayList<Auto> autolijst;
  
    
    public AutoOverzicht() {
        autolijst = new ArrayList<>(); 
        // for(Auto a : autolijst) compile fout
           
               
       
    }
    
    public void voegAutoToe(Auto a) {
  
       autolijst.add(a);
 
    }
    
    
    public String zoekAutoOpPrijs(int min_prijs, int max_prijs) {
        String s="";
        for(Auto a:autolijst){
        if(min_prijs<=a.prijs&&max_prijs>=a.prijs){
            
        s += "<table id='content'>"
                           + "<tr id='span'>"
                           + "<img src=\"" + a.imageHRef + "\"></td>"
                           + "<td>Merk: " + a.merk+ " <br>"
                           + "Type: " + a.type + "<br>"
                          
                           + "<td>prijs:"+ a.prijs+ "</td>"
                             + "</tr></table>";
             }
        }
          return s;
    }
    
     public String zoekAutoOpMerk(String merk) {
         String s="";
        for(Auto a:autolijst){
         if(merk.equals(a.merk)){
         s += "<table id='content'>"
                           + "<tr id='span'>"
                           + "<img src=\"" + a.imageHRef + "\"></td>"
                           + "<td>Merk: " + a.merk+ "<br>"
                           + "Type: " + a.type + "<br>"
                           + "<td>prijs:"+ a.prijs+ "</td>"
                             + "</tr></table>";
            }
        }
       return s;
  
    }
     
     public ArrayList<Auto> getAutolijst() {
            
        return autolijst;
  
    }
     
 
    }

