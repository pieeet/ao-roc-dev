package jspcursus.sport.vereniging;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Teamspeler implements Serializable {
	private String teamspelerCode;
	private String spelerscode;
	private String teamcode;
	
	public Teamspeler() {
		this.teamspelerCode = "";
		this.spelerscode = "";
		this.teamcode = "";
	}
	/**
	 * @param spelerscode
	 * @param teamcode
	 */
	public Teamspeler(String spelerscode, String teamcode) {
		this.spelerscode = spelerscode;
		this.teamcode = teamcode;
		this.teamspelerCode = spelerscode + teamcode;
	}
	public String getTeamspelerCode() {
		return teamspelerCode;
	}
	public void setTeamspelerCode(String teamspelerCode) {
		this.teamspelerCode = teamspelerCode;
	}
	public String getSpelerscode() {
		return spelerscode;
	}
	public void setSpelerscode(String spelerscode) {
		this.spelerscode = spelerscode;
	}
	public String getTeamcode() {
		return teamcode;
	}
	public void setTeamcode(String teamcode) {
		this.teamcode = teamcode;
	}
	
	
	

}
