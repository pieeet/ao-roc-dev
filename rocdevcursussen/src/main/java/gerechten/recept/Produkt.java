package gerechten.recept;

import org.json.JSONException;
import org.json.JSONObject;

public class Produkt {
    String naam;
    String eenheid;
    double energiePE;


    /**
     *
     */
    public Produkt() {
    }


    /**
     * @param naam
     * @param eenheid
     * @param energiePE
     */
    public Produkt(String naam, String eenheid, double energiePE) {
        this.naam = naam;
        this.eenheid = eenheid;
        this.energiePE = energiePE;
    }


    public String getNaam() {
        return naam;
    }


    public void setNaam(String naam) {
        this.naam = naam;
    }


    public String getEenheid() {
        return eenheid;
    }


    public void setEenheid(String eenheid) {
        this.eenheid = eenheid;
    }


    public double getEnergiePE() {
        return energiePE;
    }


    public void setEnergiePE(double energiePE) {
        this.energiePE = energiePE;
    }

    public JSONObject getJSON() {
        JSONObject jso = new JSONObject();
        try {
            jso.put("naam", naam);
            jso.put("eenheid", eenheid);
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return jso;


    }


}

