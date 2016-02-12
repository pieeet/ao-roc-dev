package jspcursus.eindtoets.ajaysingh;

import java.util.ArrayList;

/**
 *
 * @author ajay
 */
public class AutoOverzicht {
    ArrayList<Auto> array;
    String html = "";
    
    public AutoOverzicht()
    {
        array = new ArrayList<Auto>();
        
    }
    
    public void voegToe()
    {
        array.add(new Auto("audi", "a1", 23000));
        array.add(new Auto("audi", "a3",23000));
        array.add(new Auto("audi", "r8",123000));
        array.add(new Auto("ferrari", "enzo",200000));
        array.add(new Auto("ferrari", "testarossa", 209000));
        array.add(new Auto("fiat", "500",12000));
        array.add(new Auto("fiat", "bravo",23000));
        array.add(new Auto("fiat", "punto",16000));
        array.add(new Auto("ford", "fiesta",14000));
        array.add(new Auto("ford", "focus",25000));
        array.add(new Auto("ford", "mondeo",28000));
        array.add(new Auto("maserati", "ghibli",120000));
        array.add(new Auto("maserati", "quattroporte", 160000));
        array.add(new Auto("opel", "astra", 22000));
        array.add(new Auto("opel", "corsa", 14000));
        array.add(new Auto("opel", "mokka", 11000));
        array.add(new Auto("porsche", "cayenne", 85000));
        array.add(new Auto("porsche", "panamera", 120000));
        array.add(new Auto("porsche", "911", 26000));
    }
    
    public String zoekAutoOpPrijs(double min, double max)
    {
        for(int i = 0; i < array.size(); i++)
        {
            if(array.get(i).getPrijs() > min && array.get(i).getPrijs() < max)
            {
                html += "<br><table><tr><td><div class= \"links\">" + 
                        "<img src=\"images/" + array.get(i).getMerk() 
                        + "_" + array.get(i).getType() + ".jpg\">"
                        + "<br />Merk en Model:  " + array.get(i).getMerk() + " " + array.get(i).getType() +"</div></td>"
                        + "<td><div class=\"rechts\"> €" + array.get(i).getPrijs() + "</div></td></tr></table><br />"; 
            }
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
    
    public String getPictureLijst(String merk)
    {
        for(int i = 0; i < array.size(); i++)
        {
            if(array.get(i).getMerk().equals(merk))
            {
                html += "<img src=\"images/" + array.get(i).getMerk() + "_" + array.get(i).getType() + ".jpg\">";
            }
        }
        return html;
    }
    
    public String getResult(String merk)
    {
        for(int i = 0; i < array.size(); i++)
        {
            if(array.get(i).getMerk().equals(merk))
            {
                html += "<br><table><tr><td><div class= \"links\">" + 
                        "<img src=\"images/" + array.get(i).getMerk() 
                        + "_" + array.get(i).getType() + ".jpg\">"
                        + "<br />Merk en Model:  " + array.get(i).getMerk() + " " + array.get(i).getType() +"</div></td>"
                        + "<td><div class=\"rechts\"> €" + array.get(i).getPrijs() + "</div></td></tr></table><br />"; 
            }
        }
        return html;
    }
}