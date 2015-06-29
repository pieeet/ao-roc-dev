package jspcursus.eindtoets.timeverwijn;

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
        for(Auto a : autolijst){
            if(a.getPrijs() < min_prijs && a.getPrijs() > max_prijs){
               
            }
        }
        return autolijst;
    }
    
     public ArrayList<Auto> zoekAutoOpMerk(String merk) {
        for(Auto a : autolijst){
            if(a.getMerk().equals(merk)){
                
            }
        }
        return autolijst;
    }
     
     public ArrayList<Auto> getAutolijst() {
        return autolijst;
    }
     
     public String print(){
        String html = "<h1>Auto's</h1>\n" +
"        <table>\n" +
"            <tr>\n" +
"                <th class=\"rij1\">Model</th>\n" +
"                <th class=\"rij2\">Prijs</th>\n" +
"            </tr>";
        for(Auto a : autolijst){
            html += "<tr>\n" +
"                <td class=\"rij1\"><img src=\"images/"+a.getMerk()+"_"+a.getType()+".jpg\"><br>Merk en model: "+a.getMerk()+" "+a.getType()+"</td>\n" +
"                <td class=\"rij2\">€"+a.getPrijs()+"</td>\n" +
"            </tr>";
        }
        html += "</table>\n" +
                "<a href=\"index.jsp\">Formulier</a>";
        return html;
    }
}
