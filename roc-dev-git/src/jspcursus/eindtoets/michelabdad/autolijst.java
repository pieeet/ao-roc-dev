package jspcursus.eindtoets.michelabdad;

import java.util.ArrayList;

public class autolijst {
    public ArrayList<autogegevens> lijst = new ArrayList<>();
    
    public autolijst()
    {
        autogegevens Audi = new autogegevens("Audi", "A1", 23000,"audi_a1.jpg");
        lijst.add(Audi);
        
        autogegevens Audi2 = new autogegevens ("Audi", "A3", 23000,"audi_a3.jpg");
        lijst.add(Audi2);

        autogegevens Audi3 = new autogegevens ("Audi", "R8", 123000,"audi_r8.jpg");
        lijst.add(Audi3);

        autogegevens Ferrari = new autogegevens ("Ferrari", "Enzo", 200000,"ferrari_enzo.jpg");
        lijst.add(Ferrari);

        autogegevens Ferrari2 = new autogegevens ("Ferrari", "Testarossa", 209000,"ferrari_testarossa.jpg");
        lijst.add(Ferrari2);

        autogegevens Fiat = new autogegevens ("Fiat", "500", 12000,"fiat_500.jpg");
        lijst.add(Fiat);

        autogegevens Fiat2 = new autogegevens ("Fiat", "Bravo", 23000,"fiat_bravo.jpg");
        lijst.add(Fiat2);

        autogegevens Fiat3 = new autogegevens ("Fiat", "Punto", 16000,"fiat_punto.jpg");
        lijst.add(Fiat3);

        autogegevens Ford = new autogegevens ("Ford", "Fiesta", 14000,"ford_fiesta.jpg");
        lijst.add(Ford);

        autogegevens Ford2 = new autogegevens ("Ford", "Focus", 25000,"ford_focus.jpg");
        lijst.add(Ford2);

        autogegevens Ford3 = new autogegevens ("Ford", "Mondeo", 28000,"ford_mondeo.jpg");
        lijst.add(Ford3);

        autogegevens Maserati = new autogegevens ("Maserati", "Ghibli", 120000,"maserati_ghibli.jpg");
        lijst.add(Maserati);

        autogegevens Maserati2 = new autogegevens ("Maserati", "Quattroporte", 160000,"maserati_quattroporte.jpg");
        lijst.add(Maserati2);

        autogegevens Opel = new autogegevens ("Opel", "Astra", 22000,"opel_astra.jpg");
        lijst.add(Opel);

        autogegevens Opel2 = new autogegevens ("Opel", "Corsa", 14000,"opel_corsa.jpg");
        lijst.add(Opel2);

        autogegevens Opel3 = new autogegevens ("Opel", "Mokka", 11000,"opel_mokka.jpg");
        lijst.add(Opel3);

        autogegevens Porsche = new autogegevens ("Porsche", "Cayenne", 85000,"porsche_cayenne.jpg");
        lijst.add(Porsche);

        autogegevens Porsche2 = new autogegevens ("Porsche", "Panamera", 120000,"porsche_panamera.jpg");
        lijst.add(Porsche2);

        autogegevens Porsche3 = new autogegevens ("Porsche", "911", 126000,"porsche_911.jpg");
        lijst.add(Porsche3);

       
        
    }
    
    public ArrayList<autogegevens> getLijst()
    {
        return lijst;
    }
    
    public String zoekPrijs(int min, int max){
        String s="";
        
        for(autogegevens a : lijst){
            if(a.getPrijs() < max && a.getPrijs() > min){
                s += "<tr>";
                s += "<td class=\"autos\"><img src=\"images/"+a.getAfbeelding()+"\"height=\"125px\" width=\"200px\"><br />Merk en model: "+a.getMerk()+" "+a.getType()+ "</td>";                
                s += "<td>€"+a.getPrijs()+ "</td>";                
                s += "</tr>";
            }
        }
        
        return s;
    }
    
    public String zoekMerk(String merk){
        String s="";
        
        for(autogegevens a : lijst){
            if(a.getMerk().contains(merk)  || merk.equals("all")){
                s += "<tr>";
                s += "<td class=\"autos\"><img src=\"images/"+a.getAfbeelding()+"\"height=\"125px\" width=\"200px\"><br />Merk en model: "+a.getMerk()+" "+a.getType()+ "</td>";                
                s += "<td>€"+a.getPrijs()+ "</td>";                
                s += "</tr>";
            }
        }
        
        return s;
    }
    
}
