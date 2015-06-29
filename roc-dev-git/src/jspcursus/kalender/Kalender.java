package jspcursus.kalender;

import java.io.Serializable;
import java.util.Calendar;
import java.util.GregorianCalendar;

public class Kalender extends GregorianCalendar
						implements Serializable {
	
	private static final long serialVersionUID = 1L;
	private int maand;
	private int jaar;
	private int dag;
	private int aantalDagenMaand;
	private int laatsteDagVorigeMaand;
	private int aantalRestVorigeMaand;
	private int startVorigeMaand;
	private int[] dataVorigeMaand;

	
	//constructor met datum als argument
	public Kalender(Datum datum) {
		super(datum.getJaar(), datum.getMaand(), datum.getDag());
		maand = this.get(Calendar.MONTH);
		jaar = this.get(Calendar.YEAR);
		dag = this.get(Calendar.DAY_OF_MONTH);
		this.setAttributen();
	}

	//hulpmethoden voor de constructors
	private int aantalDagenVorigeMaand() {
		int jaarNieuw = jaar;
		int maandNieuw;
		if (this.get(Calendar.MONTH) == Calendar.JANUARY) {
			jaarNieuw = jaar - 1;
			maandNieuw = Calendar.DECEMBER;
		} else { 
			maandNieuw = maand -1;	
		}
		Calendar calVorigeMaand = new GregorianCalendar(jaarNieuw, maandNieuw, 1);
		int aantal = calVorigeMaand.getActualMaximum(Calendar.DAY_OF_MONTH);
		return aantal;
	}
	
	private int restVorigeMaand() {
		int aantal = this.get(Calendar.DAY_OF_WEEK) -2;
		if (aantal < 0 ) {
			aantal += 7;
		}
		return aantal;
	}

	private void setAttributen() {
		this.aantalDagenMaand = this.getActualMaximum(Calendar.DAY_OF_MONTH);
		this.laatsteDagVorigeMaand = this.aantalDagenVorigeMaand();
		this.aantalRestVorigeMaand = this.restVorigeMaand();
		this.startVorigeMaand = this.laatsteDagVorigeMaand - this.aantalRestVorigeMaand + 1;
		this.dataVorigeMaand = new int[this.aantalRestVorigeMaand];
		for (int i = 0; i < this.aantalRestVorigeMaand; i++) {
			this.dataVorigeMaand[i] = this.startVorigeMaand + i;
		}
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public int getDag() {
		return dag;
	}

	public void setDag(int dag) {
		this.dag = dag;
	}
	
	public int getMaand() {
		return maand;
	}

	public void setMaand(int maand) {
		this.maand = maand;
	}

	public int getJaar() {
		return jaar;
	}

	public void setJaar(int jaar) {
		this.jaar = jaar;
	}

	public int getAantalDagenMaand() {
		return aantalDagenMaand;
	}

	public void setAantalDagenMaand(int qDagenMaand) {
		this.aantalDagenMaand = qDagenMaand;
	}

	public int getLaatsteDagVorigeMaand() {
		return laatsteDagVorigeMaand;
	}

	public void setLaatsteDagVorigeMaand(int laatsteDagVorigeMaand) {
		this.laatsteDagVorigeMaand = laatsteDagVorigeMaand;
	}

	public int getAantalRestVorigeMaand() {
		return aantalRestVorigeMaand;
	}

	public void setAantalRestVorigeMaand(int qRestVorigeMaand) {
		this.aantalRestVorigeMaand = qRestVorigeMaand;
	}

	public int getStartVorigeMaand() {
		return startVorigeMaand;
	}

	public void setStartVorigeMaand(int startVorigeMaand) {
		this.startVorigeMaand = startVorigeMaand;
	}

	public int[] getDataVorigeMaand() {
		return dataVorigeMaand;
	}

	public void setDataVorigeMaand(int[] dataVorigeMaand) {
		this.dataVorigeMaand = dataVorigeMaand;
	}
	
	
	

}

