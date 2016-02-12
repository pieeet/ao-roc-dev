package mvsite.student;

import java.io.Serializable;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.commons.lang3.StringEscapeUtils;

@SuppressWarnings("serial")
public class Student implements Serializable {
	private String voornaam;
	private String tussenvoegsels;
	private String achternaam;
	private String heleNaam;
	private int level;
	private final String[] avatars = {"/images/white_belt.png", "/images/green_belt.png", "/images/black_belt.png", "/images/master.png" };
	private String webpage = null;
	private int cohort;
	private String email;

	
	

	public Student(String voornaam, String tussenvoegsels, String achternaam, int level) {
		this.voornaam = voornaam;
		this.tussenvoegsels = tussenvoegsels;
		this.achternaam = achternaam;
		this.level = level;
		if (tussenvoegsels.equals("")) {
			this.heleNaam = voornaam + " " + achternaam;
		} else {
			this.heleNaam = voornaam + " " + tussenvoegsels + " " + achternaam;
		}
		
	}
	
	//oude constructor voor autoproject 2013/14
	public Student(String voornaam, 
			String tussenvoegsels, 
			String achternaam, 
			int level, 
			String webpage) {
		this.voornaam = voornaam;
		this.tussenvoegsels = tussenvoegsels;
		this.achternaam = achternaam;
		if (tussenvoegsels.equals("")) {
			this.heleNaam = voornaam + " " + achternaam;
		} else {
			this.heleNaam = voornaam + " " + tussenvoegsels + " " + achternaam;
		}
		this.level = level;
		this.webpage = webpage;
		
	}
	
	public Student(String voornaam, 
			String tussenvoegsels, 
			String achternaam, 
			int level, 
			String webpage, 
			int cohort, 
			String email) {
		this.voornaam = voornaam;
		this.tussenvoegsels = tussenvoegsels;
		this.achternaam = achternaam;
		if (tussenvoegsels.equals("")) {
			this.heleNaam = voornaam + " " + achternaam;
		} else {
			this.heleNaam = voornaam + " " + tussenvoegsels + " " + achternaam;
		}
		this.level = level;
		this.webpage = webpage;
		this.cohort = cohort;
		this.email = email;
	}
	
	//tbv bean
	public Student() {
		
	}
	
	
	//0 = wit 3 = goud
	public int getLevel() {
		return level;
	}
	
	public String getAvatar() {
		return avatars[level];
	}
	
	public void setLevel(int level) {
		this.level = level;
	}

	public String getVoornaam() {
		return StringEscapeUtils.escapeHtml4(voornaam);
	}

	public String getTussenvoegsels() {
		return StringEscapeUtils.escapeHtml4(tussenvoegsels);
	}

	public String getAchternaam() {
		return StringEscapeUtils.escapeHtml4(achternaam);
	}
	
	public String getHeleNaam() {
		if (StringEscapeUtils.escapeHtml4(heleNaam).length() > 40) {
			return "Sufferdje: " + email;
		} else {
			return StringEscapeUtils.escapeHtml4(heleNaam);
		}
		
	}
	
	public String getWebpage() {
		try {
			URL url = new URL(webpage);
			return StringEscapeUtils.escapeHtml4(url.toString());
		} catch (MalformedURLException e) {
			return "http://www.biggestloser.com/";
		}
		
	}

	public String[] getAvatars() {
		return avatars;
	}

	public int getCohort() {
		return cohort;
	}

	public void setCohort(int cohort) {
		this.cohort = cohort;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setWebpage(String webpage) {
		this.webpage = webpage;
	}
	
	

	public void setVoornaam(String voornaam) {
		this.voornaam = voornaam;
	}

	public void setTussenvoegsels(String tussenvoegsels) {
		this.tussenvoegsels = tussenvoegsels;
	}

	public void setAchternaam(String achternaam) {
		this.achternaam = achternaam;
	}

	public void setHeleNaam(String heleNaam) {
		this.heleNaam = heleNaam;
	}


	
	
	
	

	
	
	
	
	

}
