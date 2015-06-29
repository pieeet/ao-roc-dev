package jspcursus.eindtoets.sebastianjakupovitch;

import java.util.ArrayList;


public class AutoOverzicht {
    private ArrayList<Auto> autolijst = new ArrayList<>();
    
    public AutoOverzicht() {
        Auto auto1 = (new Auto("audi_a1", "Audi", "A1", 23000));
        Auto auto2 = (new Auto("audi_a3", "Audi", "A3", 23000));
        Auto auto3 = (new Auto("audi", "Audi", "R8", 123000));
        Auto auto4 = (new Auto("ferrari_enzo", "Ferrari", "Enzo", 200000));
        Auto auto5 = (new Auto("ferrari_testarossa", "Ferrari", "Testarossa", 209000));
        Auto auto6 = (new Auto("fiat_500", "Fiat", "500", 12000));
        Auto auto7 = (new Auto("fiat_bravo", "Fiat", "Bravo", 23000));
        Auto auto8 = (new Auto("fiat_punto", "Fiat", "Punto", 16000));
        Auto auto9 = (new Auto("ford_fiesta", "Ford", "Fiesta", 14000));
        Auto auto10 = (new Auto("ford_focus", "Ford", "Focus", 25000));
        Auto auto11 = (new Auto("ford_mondeo", "Ford", "Mondeo", 28000));
        Auto auto12 = (new Auto("maserati_ghibli", "Maserati", "Ghibli", 120000));
        Auto auto13 = (new Auto("maserati_quattroporte", "Maserati", "Quattroporte", 160000));
        Auto auto14 = (new Auto("opel_astra", "Opel", "Astra", 22000));
        Auto auto15 = (new Auto("opel_corsa", "Opel", "Corsa", 14000));
        Auto auto16 = (new Auto("opel_mokka", "Opel", "Mokka", 11000));
        Auto auto17 = (new Auto("porsche_cayenne", "Porsche", "Cayenne", 85000));
        Auto auto18 = (new Auto("porsche_panamera", "Porsche", "Panamera", 120000));
        Auto auto19 = (new Auto("porsche_911", "Porsche", "911", 126000));
        
        autolijst.add(auto1);
        autolijst.add(auto2);
        autolijst.add(auto3);
        autolijst.add(auto4);
        autolijst.add(auto5);
        autolijst.add(auto6);
        autolijst.add(auto7);
        autolijst.add(auto8);
        autolijst.add(auto9);
        autolijst.add(auto10);
        autolijst.add(auto11);
        autolijst.add(auto12);
        autolijst.add(auto13);
        autolijst.add(auto14);
        autolijst.add(auto15);
        autolijst.add(auto16);
        autolijst.add(auto17);
        autolijst.add(auto18);
        autolijst.add(auto19);
        
    }

    public ArrayList<Auto> getAutolijst() {
        return autolijst;
    }
    
}
