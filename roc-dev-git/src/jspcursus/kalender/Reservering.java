package jspcursus.kalender;




public class Reservering {
	Kamer kamer;
	Datum datum;

	
	
	public Reservering(Kamer kamer, Datum datum) {
		super();
		this.kamer = kamer;
		this.datum = datum;
	}

	public Kamer getKamer() {
		return kamer;
	}

	public void setKamer(Kamer kamer) {
		this.kamer = kamer;
	}

	public Datum getDatum() {
		return datum;
	}

	public void setDatum(Datum datum) {
		this.datum = datum;
	}
	
	


}