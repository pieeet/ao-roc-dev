package jquery.yahtzee;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

@SuppressWarnings("serial")
public class Yahtzee implements Serializable {
	private String gebruikersnaam;
	private int score;
	private Date datumTijd;
	
	
	/**
	 * @param emailGebruiker
	 * @param gebruikersnaam
	 * @param score
	 * @param date
	 */
	public Yahtzee(String gebruikersnaam, int score,
			Date date) {
		this.gebruikersnaam = gebruikersnaam;
		this.score = score;
		this.datumTijd = date;
	}


	/**
	 * default constructor
	 */
	public Yahtzee() {
		this("", 0, null);
	}

	public String getGebruikersnaam() {
		return gebruikersnaam;
	}


	public void setGebruikersnaam(String gebruikersnaam) {
		this.gebruikersnaam = gebruikersnaam;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public Date getDatumTijd() {
		return datumTijd;
	}


	public void setDatumTijd(Date datumTijd) {
		this.datumTijd = datumTijd;
	}
	
	public String getDatumFormat() {
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy hh-mm-ss");
		return sdf.format(datumTijd);
	}

}
