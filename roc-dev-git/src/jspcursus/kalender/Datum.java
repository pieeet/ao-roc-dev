package jspcursus.kalender;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@SuppressWarnings("serial")
public class Datum implements Serializable {
	private int jaar;
	int maand;
	int dag;
	String maandString;
	String datumStandaardFormat;
	String datumNLFormat;
	private final String[] maanden = {"januari", "februari", 
			"maart", "april", "mei", "juni",
			"juli", "augustus", "september", 
			"oktober", "november", "december"};
	
	//specifieke datum
	public Datum(int jaar, int maand, int dag) {
		this.jaar = jaar;
		this.maand = maand;
		this.dag = dag;
		this.setAttributen();
	}
	
	//specifieke maand
	public Datum(int jaar, int maand) {
		this(jaar, maand, 1);
		this.setAttributen();
	}
	
	//huidige maand
	public Datum() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		this.dag = cal.get(Calendar.DAY_OF_MONTH);
		this.maand = cal.get(Calendar.MONTH);
		this.jaar = cal.get(Calendar.YEAR);
		this.setAttributen();
	}
	
	public Datum(String datumStandaard) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = sdf.parse(datumStandaard);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		this.dag = cal.get(Calendar.DAY_OF_MONTH);
		this.maand = cal.get(Calendar.MONTH);
		this.jaar = cal.get(Calendar.YEAR);
		this.setAttributen();
		
	}
	
	private void setAttributen() {
		this.maandString = maanden[this.maand];
		this.datumStandaardFormat = this.maakDatumFormat(this.dag, this.maand, this.jaar);
		this.datumNLFormat = this.maakNLFormat(this.dag, this.maand, this.jaar);
	}
	
	public String getMaandString() {
		return maandString;
	}

	public void setMaandString(String maandString) {
		this.maandString = maandString;
	}

	public String getDatumStandaardFormat() {
		return datumStandaardFormat;
	}

	public void setDatumStandaardFormat(String datumStandaardFormat) {
		this.datumStandaardFormat = datumStandaardFormat;
	}

	public String[] getMaanden() {
		return maanden;
	}

	private String maakDatumFormat(int dag, int maand, int jaar) {
		String datFormat ="";
		String maandFormat = "";
		if (this.maand < 9) {
			maandFormat += "-0" + (this.maand + 1);
		} else {
			maandFormat += "-" + (this.maand + 1);
		}
		String dagFormat = "";
		if (dag < 10) {
			dagFormat += "-0" + dag;
		} else {
			dagFormat += "-" + dag;
		}
		
		datFormat = "" + this.jaar + maandFormat + dagFormat;
		return datFormat;
	}
	
	private String maakNLFormat(int dag, int maand, int jaar) {
		return "" + dag + " " + this.maandString + " " + jaar;
	}
	
	
	

	public int getJaar() {
		return jaar;
	}

	public void setJaar(int jaar) {
		this.jaar = jaar;
	}

	public int getMaand() {
		return maand;
	}

	public void setMaand(int maand) {
		this.maand = maand;
	}

	public int getDag() {
		return dag;
	}

	public void setDag(int dag) {
		this.dag = dag;
	}
	
	

	public String getDatumNLFormat() {
		return datumNLFormat;
	}

	public void setDatumNLFormat(String datumNLFormat) {
		this.datumNLFormat = datumNLFormat;
	}

	@Override
	public String toString() {
		String s = "" + dag + "-" + maandString + "-" + jaar;
		return s;
	}

}
