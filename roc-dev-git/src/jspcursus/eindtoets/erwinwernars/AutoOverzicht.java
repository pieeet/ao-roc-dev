package jspcursus.eindtoets.erwinwernars;

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
    ArrayList<Auto> autolijst;
    String html, result = "";
    String gezochteMerk;
    AutoOverzicht Auto;
    String merk;
     public AutoOverzicht() {
        autolijst = new ArrayList<Auto>(); 
    }
     public void voegToe() {
        autolijst.add(new Auto("images/audi_a1.jpg","audi", "a1", 23000));
        autolijst.add(new Auto("images/audi_a3.jpg","audi", "a3", 23000));
        autolijst.add(new Auto("images/audi_r8.jpg","audi", "r8", 123000));
        autolijst.add(new Auto("images/ferrari_enzo.jpg","ferrari", "enzo", 200000));
        autolijst.add(new Auto("images/ferrari_testarossa.jpg","ferrari", "testarossa", 209000));
        autolijst.add(new Auto("images/fiat_500.jpg","fiat", "500", 12000));
        autolijst.add(new Auto("images/fiat_bravo.jpg","fiat", "bravo", 23000));
        autolijst.add(new Auto("images/fiat_punto.jpg","fiat", "punto", 16000));
        autolijst.add(new Auto("images/ford_fiesta.jpg","ford", "fiesta", 14000));
        autolijst.add(new Auto("images/ford_focus.jpg","ford", "focus", 25000));
        autolijst.add(new Auto("images/ford_mondeo.jpg","ford", "mondeo", 28000));
        autolijst.add(new Auto("images/maserati_ghibli.jpg","maserati", "ghibli", 120000));
        autolijst.add(new Auto("images/maserati_quattroporte.jpg","maserati", "quattroporte", 160000));
        autolijst.add(new Auto("images/opel_astra.jpg","opel", "astra", 22000));
        autolijst.add(new Auto("images/opel_corsa.jpg","opel", "corsa", 14000));
        autolijst.add(new Auto("images/opel_mokka.jpg","opel", "mokka", 11000));
        autolijst.add(new Auto("images/porsche_cayenne.jpg","porsche", "cayenne", 85000));
        autolijst.add(new Auto("images/porsche_panamera.jpg","porsche", "panamera", 120000));
        autolijst.add(new Auto("images/porsche_911.jpg","porsche", "911", 126000));
    }
           public String getResult(int i)
    {
        result += "<form>"
                + "<label><h1>" + autolijst.get(i).getModel() + "</h1></label><br>"
                + autolijst.get(i).getPicture() + "<br>"
                + "</form>";
        return result;
    }
      public String print() {
        html = "<h1> Auto's </h1>\n" 
             + "       <div id=\"hoofdbox\">\n" 
             + "            <p>Model</p>\n" 
             + "       </div>"
             + "       <div id=\"hoofdbox2\">\n" 
             + "            <p>Prijs</p>\n" 
             + "       </div>";
        for( Auto topgear : autolijst ) {
            html += "<div class=\"box\">\n" 
             + "            <img src=\"" + topgear.getPicture() +"\"/>\n" 
             + "            <label>" +  "€" + topgear.getPrijs() +" </label>\n" 
             + "            <p>"  + "Merk en model: " + topgear.getModel() + " " + topgear.getMerk() +  "</p>\n" 
             + "       </div>";      
        } 
        return html;
     }
      public AutoOverzicht zoek(String merk) {  
        AutoOverzicht gezochteMerk = null;
       for( Auto auto : autolijst ) {
           if( auto.getMerk().equals(merk))
                gezochteMerk = Auto;
           break; 
       } 
       return gezochteMerk;
    }
    
}
