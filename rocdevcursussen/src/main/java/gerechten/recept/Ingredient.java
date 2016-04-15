package gerechten.recept;

import org.json.JSONException;
import org.json.JSONObject;

public class Ingredient {
    private String naamGerecht;
    private String naamProdukt;
    private double hoeveelheidPP;

    /**
     * @param naamGerecht
     * @param naamProdukt
     * @param hoeveelheidPP
     */
    public Ingredient(String naamGerecht, String naamProdukt,
                      double hoeveelheidPP) {
        this.naamGerecht = naamGerecht;
        this.naamProdukt = naamProdukt;
        this.hoeveelheidPP = hoeveelheidPP;
    }

    /**
     *
     */
    public Ingredient() {
    }

    public String getNaamGerecht() {
        return naamGerecht;
    }

    public void setNaamGerecht(String naamGerecht) {
        this.naamGerecht = naamGerecht;
    }

    public String getNaamProdukt() {
        return naamProdukt;
    }

    public void setNaamProdukt(String naamProdukt) {
        this.naamProdukt = naamProdukt;
    }

    public double getHoeveelheidPP() {
        return hoeveelheidPP;
    }

    public void setHoeveelheidPP(double hoeveelheidPP) {
        this.hoeveelheidPP = hoeveelheidPP;
    }

    public JSONObject getJSON() {
        JSONObject jso = new JSONObject();
        try {
            jso.put("naamGerecht", naamGerecht);
            jso.put("naamProdukt", naamProdukt);
            jso.put("hoeveelheidPP", hoeveelheidPP);
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return jso;


    }


}

