package jspcursus.eindtoets.kevinfleur;

import java.util.*;     // beetje overbodig misschien

public class AutoOverzicht {
    String html = ""; //empty string or else there will be null on the first result
    private final ArrayList<Auto> array;
    
    public AutoOverzicht()
    {
        array = new ArrayList<>();
    }
    /**
     * auto's handmatig toevoegen.
     * voegToe methode stuurt de input waarde naar klasse Auto constructor waar ze een object worden.
     */
    public void voegToe()
    {
    array.add(new Auto("images\\audi_a1.jpg", "audi", "a1", 23000));
    array.add(new Auto("images\\audi_a3.jpg", "audi", "a3", 23000));
    array.add(new Auto("images\\audi_r8.jpg", "audi", "r8", 123000));
    array.add(new Auto("images\\ferrari_enzo.jpg", "ferrari", "enzo", 200000));
    array.add(new Auto("images\\ferrari_testarossa.jpg","ferrari", "testarossa", 209000));
    array.add(new Auto("images\\fiat_500.jpg", "fiat", "500", 12000));
    array.add(new Auto("images\\fiat_bravo.jpg", "fiat", "bravo", 23000));
    array.add(new Auto("images\\fiat_punto.jpg", "fiat", "punto", 16000));
    array.add(new Auto("images\\ford_fiesta.jpg", "ford", "fiesta", 14000));
    array.add(new Auto("images\\ford_focus.jpg", "ford", "focus", 25000));
    array.add(new Auto("images\\ford_mondeo.jpg", "ford", "mondeo", 28000));
    array.add(new Auto("images\\maserati_ghibli.jpg", "maserati", "ghibli", 120000));
    array.add(new Auto("images\\maserati_quattroporte.jpg", "maserati", "quattroporte", 160000));
    array.add(new Auto("images\\opel_astra.jpg" ,"opel", "astra", 22000));
    array.add(new Auto("images\\opel_corsa.jpg", "opel", "corsa", 14000));
    array.add(new Auto("images\\opel_mokka.jpg", "opel", "mokka", 11000));
    array.add(new Auto("images\\porsche_cayenne.jpg", "porsche", "cayenne", 85000));
    array.add(new Auto("images\\porsche_panamera.jpg", "porsche", "panamera", 120000));
    array.add(new Auto("images\\porsche_911.jpg", "porsche", "911", 126000));
    }

    public String genereerPagina()
    {
           html = " <h1>Auto's</h1>\n" 
                + "<div id=\"hoofdbox\">\n" 
                + "<label for=\"Model\">Model</label>\n"
                + "<label for=\"Prijs\">Prijs</label>\n" 
                + "</div>";
        for(Auto auto : array)
        {
           html += "<div class=\"box1\">"
                + "<div class=\"links\">"
                + "<img src=" + auto.getPicture() + ">"
                + "<div class=\"info\">"
                +  "Merk en model: "+ auto.getMerk() + " " + auto.getModelnaam() + "<br />"
                + "</div>"
                + "</div>"
                + "<div class=\"rechts\">"
                +  "€" + auto.getPrijs()
                + "</div>"
                + "</div>";
        }
        return html;
    }
    
    public String zoekAutoOpMerk(String merk) 
    {
        for(Auto auto : array)
        {
            if(auto.getMerk().equals(merk))
            {
                html += auto.getMerk();
            }
        }
        return html;
    }


 public String zoekAutoOpPrijs(double min, double max)
    {
        for(int i = 0; i < array.size(); i++)
        {
            if(array.get(i).getPrijs() > min && array.get(i).getPrijs() < max)
            {
                html += "<br><table><tr><td><div class= \"links\">" + 
                        "<img src=\"images/" + array.get(i).getMerk() 
                 //       + "_" + array.get(i).getType() + ".jpg\">"
                   //     + "<br />Merk en Model:  " + array.get(i).getMerk() + " " + array.get(i).getType() +"</div></td>"
                        + "<td><div class=\"rechts\"> €" + array.get(i).getPrijs() + "</div></td></tr></table><br />"; 
            }
        }
        
        return html;
    }



}


