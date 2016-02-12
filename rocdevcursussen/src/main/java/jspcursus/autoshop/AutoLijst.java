package jspcursus.autoshop;

import java.util.ArrayList;

/**
 * Klasse met een lijst van auto's
 * @author piet
 */
public class AutoLijst {
    private ArrayList<Auto> autolijst;
    
    /**
     * Constructor die de lijst aanmaakt en auto's toevoegt
     */
    public AutoLijst() {
        autolijst = new ArrayList<Auto>();
        Auto ford1 = new Auto("Ford", "Fiesta", 23999, "/AO/JSP_Java_DB/images/autos/fordfiesta.jpg");
        autolijst.add(ford1);
        Auto ford2 = new Auto("Ford", "Focus", 18995, "/AO/JSP_Java_DB/images/autos/fordfocus.jpg");
        autolijst.add(ford2);
        Auto opel1 = new Auto("Opel", "Astra", 14895, "/AO/JSP_Java_DB/images/autos/opelastra.jpg");
        autolijst.add(opel1);
        Auto opel2 = new Auto("Opel", "Insignia", 65450, "/AO/JSP_Java_DB/images/autos/opelinsignia.jpg");
        autolijst.add(opel2);
        Auto subaru1 = new Auto("Subaru", "Forester", 34750, "/AO/JSP_Java_DB/images/autos/subaruforester.jpg");
        autolijst.add(subaru1);
        Auto subaru2 = new Auto("Subaru", "Impreza", 28345, "/AO/JSP_Java_DB/images/autos/subaruimpreza.jpg");
        autolijst.add(subaru2);
        Auto mercedes1 = new Auto("Mercedes", "E 63", 110995, "/AO/JSP_Java_DB/images/autos/mercedede63.png");
        autolijst.add(mercedes1);
        Auto mercedes2 = new Auto("Mercedes", "CLA 45", 190780, "/AO/JSP_Java_DB/images/autos/mercedescla45.jpg");
        autolijst.add(mercedes2);
        Auto mercedes3 = new Auto("Mercedes", "E 230", 1000, "/AO/JSP_Java_DB/images/autos/mercedese230.jpg");
        autolijst.add(mercedes3);
        Auto mercedes4 = new Auto("Mercedes", "C 250", 599, "/AO/JSP_Java_DB/images/autos/mercedesc250.jpg");
        autolijst.add(mercedes4);
        Auto ferrari1 = new Auto("Ferrari", "612 GTO", 350500, "/AO/JSP_Java_DB/images/autos/ferrari612.jpg");
        autolijst.add(ferrari1);
        Auto ferrari2 = new Auto("Ferrari", "California", 210780, "/AO/JSP_Java_DB/images/autos/ferraricalifornia.jpg");
        autolijst.add(ferrari2);
        Auto ferrari3 = new Auto("Ferrari", "458", 280775, "/AO/JSP_Java_DB/images/autos/ferrari458.jpg");
        autolijst.add(ferrari3);
        Auto lotus1 = new Auto("Lotus", "Elise CR", 48591, "/AO/JSP_Java_DB/images/autos/lotuselisecr.jpg");
        autolijst.add(lotus1);
        Auto lotus2 = new Auto("Lotus", "Elise S CR", 60079, "/AO/JSP_Java_DB/images/autos/lotuselisescr.jpg");
        autolijst.add(lotus2);
        Auto citroen1 = new Auto("Citroen", "2CV", 459, "/AO/JSP_Java_DB/images/autos/citroen2cv.jpg");
        autolijst.add(citroen1);
        Auto volvo1 = new Auto("Volvo", "V40", 1250, "/AO/JSP_Java_DB/images/autos/volvov40.jpg");
        autolijst.add(volvo1);
        Auto mini1 = new Auto("Mini", "Cooper", 34495, "/AO/JSP_Java_DB/images/autos/minicooper.jpg");
        autolijst.add(mini1);
    }
    
    /**
     * 
     * @return geeft de lijst met auto's
     */
    public ArrayList<Auto> getLijst() {
        return autolijst;
    }
    
    /**
     * Ten behoeve van het select merk input veld
     * @return een lijst met alle unieke merken
     */
    public ArrayList<String> getMerken() {
        ArrayList<String> merken = new ArrayList<String>();
        for (Auto auto: autolijst) {
            String merk = auto.getMerk();
            if (!merken.contains(merk)) {
                merken.add(merk);
            }
        }
        return merken;
    }
    

}
