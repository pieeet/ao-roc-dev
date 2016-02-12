package jspcursus.kalender;




public class Reservering {
	Kamer kamer;
	Datum datum;
	String emailUser;

	
	
	public Reservering(Kamer kamer, Datum datum, String emailUser) {
		super();
		this.kamer = kamer;
		this.datum = datum;
		this.emailUser = emailUser;
	}

	public String getEmailUser() {
		return emailUser;
	}

	public void setEmailUser(String emailUser) {
		this.emailUser = emailUser;
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