package jspcursus.sport.vereniging;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.lang3.StringEscapeUtils;






import com.google.appengine.api.blobstore.BlobKey;
import org.json.JSONException;
import org.json.JSONObject;


@SuppressWarnings("serial")
public class Lid implements Serializable {
	private int nr;
	
	private String spelerscode, roepnaam, tussenvoegsels, achternaam;
	private String adres, postcode, woonplaats, telefoon, email, geboortedatum, geslacht;
	private String indiener = null;
	private BlobKey blobKey;
	
	public Lid() {
		this.spelerscode = "";
		this.roepnaam = "";
		this.tussenvoegsels = "";
		this.achternaam = "";
		this.adres = "";
		this.postcode = "";
		this.woonplaats = "";
		this.telefoon = "";
		this.email = "";
		this.geboortedatum = "";
		this.geslacht = "";
		this.blobKey = null;
	}


	
	/**
	 * maakt een nieuw lid-object obv invoer
	 * @param roepnaam
	 * @param tussenvoegsels
	 * @param achternaam
	 * @param adres
	 * @param postcode
	 * @param woonplaats
	 * @param telefoon
	 * @param email
	 * @param geboortedatum
	 * @param geslacht
	 */
	public Lid (String roepnaam, String tussenvoegsels,
            String achternaam, String adres, String postcode, String woonplaats, String telefoon, 
            String email, String geboortedatum, String geslacht) {
		this();
        
    	//check op geldige datum
        DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false);
        Date gebdat;
        try {
            gebdat = sdf.parse(geboortedatum);
            this.geboortedatum = sdf.format(gebdat);
        }
        catch(ParseException | NullPointerException e) {
            this.geboortedatum = sdf.format(new Date());
        }
        this.roepnaam = roepnaam.trim();
        this.tussenvoegsels = tussenvoegsels.trim();
        this.achternaam = achternaam.trim();
        this.email = email.trim();
        
      //maak automatisch spelerscode aan
        if(email.equals("")) {
        	email="onbekend";
        }
        this.spelerscode = this.geboortedatum + email.trim();
        this.adres = adres.trim();
        this.postcode = postcode.trim();
        this.woonplaats = woonplaats.trim();
        this.telefoon = telefoon.trim();
        this.geslacht = geslacht.trim();
        this.blobKey = null;
        
    }
	
	public void setIndiener(String user) {
		this.indiener = user;
	}
	
	public String getIndiener() {
		String s = "";
		if (indiener != null) {
			s = this.indiener;
		}
		return s;
	}

	public int getNr() {
		return nr;
	}

	public void setNr(int nr) {
		this.nr = nr;
	}

	public String getSpelerscode() {
		return spelerscode;
	}
	public String getSpelerscodeEsc() {
		return StringEscapeUtils.escapeHtml4(spelerscode);
	}

	public void setSpelerscode(String spelerscode) {
		this.spelerscode = spelerscode;
	}

	public String getRoepnaam() {
		return roepnaam;
	}
	public String getRoepnaamEsc() {
		return StringEscapeUtils.escapeHtml4(roepnaam);
	}
	

	public void setRoepnaam(String roepnaam) {
		this.roepnaam = roepnaam;
	}

	public String getTussenvoegsels() {
		return tussenvoegsels;
	}
	
	public String getTussenvoegselsEsc() {
		return StringEscapeUtils.escapeHtml4(tussenvoegsels);
	}

	public void setTussenvoegsels(String tussenvoegsels) {
		this.tussenvoegsels = tussenvoegsels;
	}

	public String getAchternaam() {
		return achternaam;
	}
	
	public String getAchternaamEsc() {
		return StringEscapeUtils.escapeHtml4(achternaam);
	}

	public void setAchternaam(String achternaam) {
		this.achternaam = achternaam;
	}
	
	public String getNaam() {
		String naam;
		if (tussenvoegsels.equals("")) {
			naam = roepnaam + " " + achternaam;
		} else {
			naam = roepnaam + " " + tussenvoegsels + " " + achternaam;
		}
		return naam;
	}
	
	public String getNaamEsc() {
		return StringEscapeUtils.escapeHtml4(this.getNaam());
	}

	public String getAdres() {
		return adres;
	}
	
	public String getAdresEsc() {
		return StringEscapeUtils.escapeHtml4(adres);
	}

	public void setAdres(String adres) {
		this.adres = adres;
	}

	public String getPostcode() {
		return postcode;
	}
	
	public String getPostcodeEsc() {
		return StringEscapeUtils.escapeHtml4(this.postcode);
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getWoonplaats() {
		return woonplaats;
	}
	
	public String getWoonplaatsEsc() {
		return StringEscapeUtils.escapeHtml4(woonplaats);
	}

	public void setWoonplaats(String woonplaats) {
		this.woonplaats = woonplaats;
	}

	public String getTelefoon() {
		return telefoon;
	}
	
	public String getTelefoonEsc() {
		return StringEscapeUtils.escapeHtml4(telefoon);
	}

	public void setTelefoon(String telefoon) {
		this.telefoon = telefoon;
	}
	
	public String getEmail() {
		return email;
	}
	public String getEmailEsc() {
		return StringEscapeUtils.escapeHtml4(email);
	}
	
	
	public void setEmail(String email) {
		this.email = email;
	}

	public String getGeboortedatum() {
		return geboortedatum;
	}
	
	public String getGeboortedatumEsc() {
		return StringEscapeUtils.escapeHtml4(geboortedatum);
	}

	public void setGeboortedatum(String geboortedatum) {
		this.geboortedatum = geboortedatum;
	}

	public String getGeslacht() {
		return geslacht;
	}
	
	public String getGeslachtEsc() {
		return StringEscapeUtils.escapeHtml4(geslacht);
	}

	public void setGeslacht(String geslacht) {
		this.geslacht = geslacht;
	}

	public BlobKey getBlobkey() {
		return blobKey;
	}

	public void setBlobkey(BlobKey blobkey) {
		this.blobKey = blobkey;
	}


	public JSONObject getlidAsJSONObject() {
		JSONObject lid = new JSONObject();
		try {
			lid.put("spelerscode", this.getSpelerscodeEsc());
			lid.put("spelersnummer", this.nr);
			lid.put("roepnaam", this.getRoepnaamEsc());
			lid.put("tussenvoegsels", this.getTussenvoegselsEsc());
			lid.put("achternaam", this.getAchternaamEsc());
			lid.put("adres", this.getAdresEsc());
			lid.put("postcode", this.getPostcodeEsc());
			lid.put("woonplaats", this.getWoonplaatsEsc());
			lid.put("telefoon", this.getTelefoonEsc());
			lid.put("email", this.getEmailEsc());
			lid.put("geboortedatum", this.getGeboortedatumEsc());
			lid.put("geslacht", this.getGeslachtEsc());
			lid.put("blobKey", this.blobKey);

		} catch (JSONException e) {
			e.printStackTrace();
		}
		return lid;
	}
	
	

}
