package jspcursus.autoshop;

import java.util.ArrayList;

/**
 * Created by Piet de Vries on 11-09-18.
 * Utility cLass to retrieve hard-coded data.
 * Class contains only static methods so no need to instanciate
 */
public class DataUtils {

    private static final ArrayList<Auto> sAutolijst = new ArrayList<>();

    // Static initializer. This is run the first time anything is called from this class.
    static {
        sAutolijst.add(new Auto("Ford", "Fiesta", 23999,
                "/AO/JSP_Java_DB/images/autos/fordfiesta.jpg"));
        sAutolijst.add(new Auto("Ford", "Focus", 18995,
                "/AO/JSP_Java_DB/images/autos/fordfocus.jpg"));
        sAutolijst.add(new Auto("Opel", "Astra", 14895,
                "/AO/JSP_Java_DB/images/autos/opelastra.jpg"));
        sAutolijst.add(new Auto("Opel", "Insignia", 65450,
                "/AO/JSP_Java_DB/images/autos/opelinsignia.jpg"));
        sAutolijst.add(new Auto("Subaru", "Forester", 34750,
                "/AO/JSP_Java_DB/images/autos/subaruforester.jpg"));
        sAutolijst.add(new Auto("Subaru", "Impreza", 28345,
                "/AO/JSP_Java_DB/images/autos/subaruimpreza.jpg"));
        sAutolijst.add(new Auto("Mercedes", "E 63", 110995,
                "/AO/JSP_Java_DB/images/autos/mercedede63.png"));
        sAutolijst.add(new Auto("Mercedes", "CLA 45", 190780,
                "/AO/JSP_Java_DB/images/autos/mercedescla45.jpg"));
        sAutolijst.add(new Auto("Mercedes", "E 230", 1000,
                "/AO/JSP_Java_DB/images/autos/mercedese230.jpg"));
        sAutolijst.add(new Auto("Mercedes", "C 250", 599,
                "/AO/JSP_Java_DB/images/autos/mercedesc250.jpg"));
        sAutolijst.add(new Auto("Ferrari", "612 GTO", 350500,
                "/AO/JSP_Java_DB/images/autos/ferrari612.jpg"));
        sAutolijst.add(new Auto("Ferrari", "California", 210780,
                "/AO/JSP_Java_DB/images/autos/ferraricalifornia.jpg"));
        sAutolijst.add(new Auto("Ferrari", "458", 280775,
                "/AO/JSP_Java_DB/images/autos/ferrari458.jpg"));
        sAutolijst.add(new Auto("Lotus", "Elise CR", 48591,
                "/AO/JSP_Java_DB/images/autos/lotuselisecr.jpg"));
        sAutolijst.add(new Auto("Lotus", "Elise S CR", 60079,
                "/AO/JSP_Java_DB/images/autos/lotuselisescr.jpg"));
        sAutolijst.add(new Auto("Citroen", "2CV", 459,
                "/AO/JSP_Java_DB/images/autos/citroen2cv.jpg"));
        sAutolijst.add(new Auto("Volvo", "V40", 1250,
                "/AO/JSP_Java_DB/images/autos/volvov40.jpg"));
        sAutolijst.add(new Auto("Mini", "Cooper", 34495,
                "/AO/JSP_Java_DB/images/autos/minicooper.jpg"));
    }

    public static ArrayList<Auto> getAutolijst() {
        return sAutolijst;
    }

    static ArrayList<Auto> getAutosGefilterd(String invoerMerk, String invoerMinPrijs, String invoerMaxPrijs) {
        int minPrijs;
        int maxPrijs;
        String merk = null;
        if (invoerMerk != null && !invoerMerk.equals("alle")) {
            merk = invoerMerk;
        }

        try {
            minPrijs = Integer.parseInt(invoerMinPrijs);
        } catch (NumberFormatException e) {
            minPrijs = 0;
        }
        try {
            maxPrijs = Integer.parseInt(invoerMaxPrijs);
        } catch (NumberFormatException e) {
            maxPrijs = Integer.MAX_VALUE;
        }
        ArrayList<Auto> selectieLijst = new ArrayList<>();
        for (Auto auto: sAutolijst) {
            boolean prijsIsInRange = false;
            if (auto.getPrijs() > minPrijs && auto.getPrijs() < maxPrijs) {
                prijsIsInRange = true;
            }
            if (prijsIsInRange && (merk == null || auto.getMerk().equals(merk))) {
                selectieLijst.add(auto);
            }
        }
        return selectieLijst;
    }


    /**
     * Ten behoeve van het select merk input veld
     * @return een lijst met alle unieke merken
     */
    public static ArrayList<String> getMerken() {
        ArrayList<String> merken = new ArrayList<>();
        for (Auto auto: getAutolijst()) {
            String merk = auto.getMerk();
            if (!merken.contains(merk)) {
                merken.add(merk);
            }
        }
        return merken;
    }

}
