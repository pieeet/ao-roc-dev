package jspcursus.sport.vereniging;

import java.io.Serializable;

import org.apache.commons.lang3.StringEscapeUtils;

@SuppressWarnings("serial")
public class Team implements Serializable {
	private String teamcode;
	private String omschrijving;
	
	public Team(String teamcode, String omschrijving) {
		this();
		if (StringEscapeUtils.escapeXml11(teamcode).length() <= 6) {
			this.teamcode = teamcode;
		}
		if (StringEscapeUtils.escapeXml11(omschrijving).length() <= 16) {
			this.omschrijving = omschrijving;
		}
		
		
	}
	
	public Team() {
		this.teamcode = "";
		this.omschrijving = "";
	}
	
	public String getTeamcode() {
		return teamcode;
	}

	public String getTeamcodeEsc() {
		return StringEscapeUtils.escapeHtml4(teamcode);
	}

	public void setTeamcode(String teamcode) {
		this.teamcode = teamcode;
	}

	public String getOmschrijvingEsc() {
		return StringEscapeUtils.escapeHtml4(omschrijving);
	}
	
	public String getOmschrijving() {
		return omschrijving;
	}
	

	public void setOmschrijving(String omschrijving) {
		this.omschrijving = omschrijving;
	}
	
	
	
	
}

