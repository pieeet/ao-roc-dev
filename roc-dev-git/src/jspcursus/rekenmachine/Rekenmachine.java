package jspcursus.rekenmachine;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Rekenmachine implements Serializable {
	private String uitkomst = "";
	private String waarschuwing = "";
	
	
	public Rekenmachine(String getal1, String getal2, String functie) {
		bereken(getal1, getal2, functie);
	}
	
	public Rekenmachine() {}

	private void bereken(String getal1, String getal2, String functie) {
		
		try {
			double arg1 = Double.parseDouble(getal1);
			double arg2 = Double.parseDouble(getal2);
			
			switch (functie) {
			
			case "plus": uitkomst +=  (arg1 + arg2);
			break;
			
			case "min": uitkomst +=  (arg1 - arg2);
			break;
			
			case "maal": uitkomst +=  (arg1 * arg2);
			break;
			
			case "delen": uitkomst +=  (arg1 / arg2);
			break;
			}
		} catch(NumberFormatException e) {
		      waarschuwing = "Voer twee (decimale) getallen in";
	    }
	}
	
	public String getUitkomst() {
		return uitkomst;
	}

	public void setUitkomst(String uitkomst) {
		this.uitkomst = uitkomst;
	}

	public String getWaarschuwing() {
		return waarschuwing;
	}

	public void setWaarschuwing(String waarschuwing) {
		this.waarschuwing = waarschuwing;
	}

}
