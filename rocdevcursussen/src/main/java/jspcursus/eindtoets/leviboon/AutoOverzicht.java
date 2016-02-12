package jspcursus.eindtoets.leviboon;

import java.util.ArrayList;
/**
 *
 * @author Levi
 */
public class AutoOverzicht {
    public final ArrayList<Auto> autolijst = new ArrayList<>();
    
    public AutoOverzicht() {
        Auto auto1 =new Auto("audi", "a1", 23000);
        Auto auto2 =new Auto("audi", "a3", 23000);
        Auto auto3 =new Auto("audi", "r8", 123000);
        Auto auto4 =new Auto("ferrari", "enzo", 200000);
        Auto auto5 =new Auto("ferrari", "testarossa", 209000);
        Auto auto6 =new Auto("fiat", "500", 12000);
        Auto auto7 =new Auto("fiat", "bravo", 23000);
        Auto auto8 =new Auto("fiat", "punto", 16000);
        Auto auto9 =new Auto("ford", "fiesta", 14000);
        Auto auto10 =new Auto("ford", "focus", 25000);
        Auto auto11 =new Auto("ford", "mondeo", 28000);
        Auto auto12 =new Auto("maserati", "ghibli", 120000);
        Auto auto13 =new Auto("maserati", "quattroporte", 160000);
        Auto auto14 =new Auto("opel", "astra", 22000);
        Auto auto15 =new Auto("opel", "corsa", 14000);
        Auto auto16 =new Auto("opel", "mokka", 11000);
        Auto auto17 =new Auto("porsche", "cayenne", 85000);
        Auto auto18 =new Auto("porsche", "panamera", 120000);
        Auto auto19 =new Auto("porsche", "911", 126000);
        autolijst. add(auto1);
        autolijst. add(auto2);
        autolijst. add(auto3);
        autolijst. add(auto4);
        autolijst. add(auto5);
        autolijst. add(auto6);
        autolijst. add(auto7);
        autolijst. add(auto8);
        autolijst. add(auto9);
        autolijst. add(auto10);
        autolijst. add(auto11);
        autolijst. add(auto12);
        autolijst. add(auto13);
        autolijst. add(auto14);
        autolijst. add(auto15);
        autolijst. add(auto16);
        autolijst. add(auto17);
        autolijst. add(auto18);
        autolijst. add(auto19);
    }
     public ArrayList<Auto> getAutolijst() {
        return autolijst;
    }
}
