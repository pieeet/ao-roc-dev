package gerechten.recept;

import org.json.JSONException;
import org.json.JSONObject;

public class Gerecht {
    private String naam;
    private int bereidingstijd;
    private String bereidingswijze;

    /**
     * @param naam
     * @param bereidingstijd
     * @param bereidingswijze
     */
    public Gerecht(String naam, int bereidingstijd, String bereidingswijze) {
        this.naam = naam;
        this.bereidingstijd = bereidingstijd;
        this.bereidingswijze = bereidingswijze;
    }

    /**
     *
     */
    public Gerecht() {
        naam = "";
        bereidingstijd = 0;
        bereidingswijze = "";
    }

    public String getNaam() {
        return naam;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public int getBereidingstijd() {
        return bereidingstijd;
    }

    public void setBereidingstijd(int bereidingstijd) {
        this.bereidingstijd = bereidingstijd;
    }

    public String getBereidingswijze() {
        return bereidingswijze;
    }

    public void setBereidingswijze(String bereidingswijze) {
        this.bereidingswijze = bereidingswijze;
    }

    public JSONObject getJSON() {
        JSONObject jso = new JSONObject();
        try {
            jso.put("naam", naam);
            jso.put("bereidingstijd", this.bereidingstijd);
            jso.put("bereidingswijze", bereidingswijze);
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return jso;


    }


}
