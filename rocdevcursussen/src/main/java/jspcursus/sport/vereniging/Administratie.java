package jspcursus.sport.vereniging;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

import jspcursus.sport.dataIO.DataIOInterface;
import jspcursus.sport.dataIO.DatastoreIO;

import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;

public class Administratie implements DataIOInterface {
	private DatastoreIO io;
	private MemcacheService cache;
	private ArrayList<Lid> leden;
	private ArrayList<Team> teams;
	private ArrayList<Teamspeler> teamspelers;
	
	public Administratie() {
		io = new DatastoreIO();
		cache = MemcacheServiceFactory.getMemcacheService();
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Lid> getLedenlijst() {
		leden = (ArrayList<Lid>) cache.get("leden");
		if (leden == null) {
			leden = io.getLedenlijst();
			cache.put("leden", leden);
		}
		Collections.sort(leden, new LidComparator());
		return leden;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Team> getTeamlijst() {
		teams = (ArrayList<Team>) cache.get("teams");
		if (teams == null) {
			teams = io.getTeamlijst();
			cache.put("teams", teams);
		}
		Collections.sort(teams, new TeamComparator());
		return teams;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Teamspeler> getTeamspelers() {
		teamspelers = (ArrayList<Teamspeler>) cache.get("teamspelers");
		if (teamspelers == null) {
			teamspelers = io.getTeamspelers();
			cache.put("teamspelers", teamspelers);
		}
		return teamspelers;
	}
	
	@Override
	public void voegLidToe(Lid lid) {
		leden = this.getLedenlijst();
		int hoogsteNummer = 0;
		for (Lid l: leden) {
			if (l.getNr() > hoogsteNummer) {
				hoogsteNummer = l.getNr();
			}
		}
		lid.setNr(hoogsteNummer + 1);
		leden.add(lid);
		cache.put("leden", leden);
		io.voegLidToe(lid);
	}
	
	@Override
	public Lid getLid(String spelerscode) {
		leden = this.getLedenlijst();
		Lid lid = null;
		for (Lid l: leden) {
			if (l.getSpelerscode().equals(spelerscode)) {
				lid = l;
			}
		}
		if (lid == null) {
			lid = io.getLid(spelerscode);
		}
		return lid;
	}
	
	@Override
	public void verwijderLid(Lid lid) {
		ArrayList<Team> teamsLid = this.getSpelerteams(lid);
		for (Team team : teamsLid) {
			io.verwijderTeamspeler(team, lid);
		}
		leden = this.getLedenlijst();
		for (Lid l: leden) {
			if (l.getSpelerscode().equals(lid.getSpelerscode())) {
				leden.remove(l);
				cache.put("leden", leden);
				break;
			}
		}
		teamspelers = this.getTeamspelers();
		ArrayList<Teamspeler> teamspelersNieuw = new ArrayList<>();
		boolean lijstVeranderd = false;
		for (Teamspeler ts: teamspelers) {
			if (!ts.getSpelerscode().equals(lid.getSpelerscode())) {
				teamspelersNieuw.add(ts);
			} else {
				lijstVeranderd = true;
			}
		}
		if (lijstVeranderd) {
			teamspelers = teamspelersNieuw;
			cache.put("teamspelers", teamspelers);
		}
		io.verwijderLid(lid);
	}
	
	@Override
	public void wijzigLid(Lid lid) {
		leden = this.getLedenlijst();
		ArrayList<Lid> ledenNieuw = new ArrayList<Lid>();
		for (Lid l: leden) {
			if (!l.getSpelerscode().equals(lid.getSpelerscode())) {
				ledenNieuw.add(l);
			} else {
				ledenNieuw.add(lid);
			}
		}
		leden = ledenNieuw;
		cache.put("leden", leden);
		io.wijzigLid(lid);
	}
	
	@Override
	public void voegTeamToe(Team team) {
		teams = this.getTeamlijst();
		teams.add(team);
		cache.put("teams", teams);
		io.voegTeamToe(team);
	}
	
	@Override
	public void verwijderTeam(Team team) {
		ArrayList<Lid> spelersVanTeam = this.getTeamspelers(team);
		for (Lid lid : spelersVanTeam) {
			io.verwijderTeamspeler(team, lid);
		}
		teams = this.getTeamlijst();
		for (Team t: teams) {
			if (t.getTeamcode().equals(team.getTeamcode())) {
				teams.remove(t);
				cache.put("teams", teams);
				break;
			}
		}
		teamspelers = this.getTeamspelers();
		ArrayList<Teamspeler> teamspelersNieuw = new ArrayList<Teamspeler>();
		boolean veranderd = false;
		for (Teamspeler ts: teamspelers) {
			if (!ts.getTeamcode().equals(team.getTeamcode())) {
				teamspelersNieuw.add(ts);
			} else {
				veranderd = true;
			}
		}
		if (veranderd) {
			teamspelers = teamspelersNieuw;
			cache.put("teamspelers", teamspelers);
		}
		io.verwijderTeam(team);
	}
	
	@Override
	public void wijzigTeam(Team team) {
		teams = this.getTeamlijst();
		ArrayList<Team> teamsNieuw = new ArrayList<Team>();
		for (Team t: teams) {
			if (!t.getTeamcode().equals(team.getTeamcode())) {
				teamsNieuw.add(t);
			} else {
				teamsNieuw.add(team);
			}
		}
		teams = teamsNieuw;
		cache.put("teams", teams);
		io.wijzigTeam(team);
	}
	
	@Override
	public Team getTeam(String teamcode) {
		teams = this.getTeamlijst();
		Team team = null;
		for (Team t: teams) {
			if (t.getTeamcode().equals(teamcode)) {
				team = t;
				break;
			}
		}
		if (team == null) {
			team = io.getTeam(teamcode);
		}
		
		return team;
	}
	
	@Override
	public ArrayList<Lid> getTeamspelers(Team team) {
		teamspelers = this.getTeamspelers();
		leden = this.getLedenlijst();
		ArrayList<Lid> spelersVanTeam = new ArrayList<Lid>();
		for (Teamspeler ts: teamspelers) {
			if (ts.getTeamcode().equals(team.getTeamcode())) {
				for (Lid l: leden) {
					if (ts.getSpelerscode().equals(l.getSpelerscode())) {
						spelersVanTeam.add(l);
					}
				}
			}
		}
		Collections.sort(spelersVanTeam, new LidComparator());
		return spelersVanTeam;
	}
	
	@Override
	public ArrayList<Team> getSpelerteams(Lid lid)  {
		teamspelers = this.getTeamspelers();
		teams = this.getTeamlijst();
		ArrayList<Team> teamsVanSpeler = new ArrayList<Team>();
		for (Teamspeler ts: teamspelers) {
			if (ts.getSpelerscode().equals(lid.getSpelerscode())) {
				for (Team t: teams) {
					if (ts.getTeamcode().equals(t.getTeamcode())) {
						teamsVanSpeler.add(t);
					}
				}
			}
		}
		Collections.sort(teamsVanSpeler, new TeamComparator());
		return teamsVanSpeler;
	}
	
	@Override
	public void verwijderTeamspeler(Team team, Lid lid) {
		teamspelers = this.getTeamspelers();
		for (Teamspeler ts: teamspelers) {
			if (ts.getTeamspelerCode().equals(lid.getSpelerscode() + team.getTeamcode()) ) {
				teamspelers.remove(ts);
				cache.put("teamspelers", teamspelers);
				break;
			}
		}
		io.verwijderTeamspeler(team, lid);
	}
	
	@Override
	public void setTeamspeler(Team team, Lid lid) {
		teamspelers = this.getTeamspelers();
		Teamspeler ts = new Teamspeler(lid.getSpelerscode(), team.getTeamcode());
		teamspelers.add(ts);
		cache.put("teamspelers", teamspelers);
		io.setTeamspeler(team, lid);
		
	}
	
	class LidComparator implements Comparator<Lid> {
	    @Override
	    public int compare(Lid o1, Lid o2) {
	        return o1.getAchternaam().toLowerCase().compareTo(o2.getAchternaam().toLowerCase());
	    }
	}
	
	class TeamComparator implements Comparator<Team> {
	    @Override
	    public int compare(Team o1, Team o2) {
	        return o1.getOmschrijving().toLowerCase().compareTo(o2.getOmschrijving().toLowerCase());
	    }
	}

}
