package jspcursus.eindtoets.gillianoherkul;

import java.util.ArrayList;

public class AutoOverzicht {
    private ArrayList<Auto> lijst;
    
    
    public AutoOverzicht()
    {
        lijst = new ArrayList<>();
        
        Auto mercedes = new Auto("mercedes ", "m1",  23000, "Mercedes Benz Silver-Lightning.jpg");
        lijst.add(mercedes);
        
        Auto ferrari = new Auto("ferrari ", "f2",  35000, "Ferrari LaFerrari.jpg");
        lijst.add(ferrari);
        
        Auto mcLaren = new Auto("McLaren ", "a3",  30000, "McLaren.jpg");
        lijst.add(mcLaren);
    }

    public ArrayList<Auto> getLijst() {
        return lijst;
    }
    
    public ArrayList<String> getMrken()
    {
         ArrayList<String> merken = new ArrayList<String>();
        for (Auto auto: lijst) {
            String merk = auto.getMerk();
            if (!merken.contains(merk)) {
                merken.add(merk);
      }
    
 }
     return merken;   
    }
}