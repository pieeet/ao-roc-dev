package jspcursus.sport.dataIO;
import java.util.ArrayList;



import jspcursus.sport.vereniging.*;

public interface DataIOInterface {

	public void voegLidToe(Lid lid);
	public void verwijderLid(Lid lid);
	public void wijzigLid(Lid lid);
	public Lid getLid(String spelerscode);
	public ArrayList<Lid> getLedenlijst();
	public void voegTeamToe(Team team);
	public void setTeamspeler(Team team, Lid lid);
	public void verwijderTeamspeler(Team team, Lid lid);
	public ArrayList<Lid> getTeamspelers(Team team);
	public ArrayList<Teamspeler> getTeamspelers();
	public ArrayList<Team> getSpelerteams(Lid lid);
	public void verwijderTeam(Team team);
	public void wijzigTeam(Team team);
	public Team getTeam(String teamcode);
	public ArrayList<Team> getTeamlijst();

}
