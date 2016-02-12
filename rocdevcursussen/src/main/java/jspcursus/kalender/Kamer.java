package jspcursus.kalender;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Kamer implements Serializable {
	String naam;
	int prijsPerNacht;
	
	public Kamer() {
		this.naam = "";
		this.prijsPerNacht = 0;
	}
	
	public Kamer(String naam, int prijsPerNacht) {
		this.naam = naam;
		this.prijsPerNacht = prijsPerNacht;
	}

	public String getNaam() {
		return naam;
	}

	public void setNaam(String naam) {
		this.naam = naam;
	}

	public int getPrijsPerNacht() {
		return prijsPerNacht;
	}

	public void setPrijsPerNacht(int prijsPerNacht) {
		this.prijsPerNacht = prijsPerNacht;
	}

}
