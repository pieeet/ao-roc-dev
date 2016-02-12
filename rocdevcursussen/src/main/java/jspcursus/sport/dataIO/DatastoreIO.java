package jspcursus.sport.dataIO;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import jspcursus.sport.vereniging.Lid;
import jspcursus.sport.vereniging.Team;
import jspcursus.sport.vereniging.Teamspeler;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceConfig;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.ReadPolicy;


public class DatastoreIO implements DataIOInterface {
	private DatastoreService datastore;
	private BlobstoreService blobstore;
	// Construct a read policy for strong or eventual consistency
	ReadPolicy policy = new ReadPolicy(ReadPolicy.Consistency.STRONG);
	    
	// Set the read policy
	DatastoreServiceConfig strongConsistentConfig =
	                         DatastoreServiceConfig.Builder.withReadPolicy(policy);
	double deadline = 5.0;    
	// Set the call deadline
	DatastoreServiceConfig deadlineConfig =
	                         DatastoreServiceConfig.Builder.withDeadline(deadline);
	    
	// Set both the read policy and the call deadline
	DatastoreServiceConfig datastoreConfig =
	      DatastoreServiceConfig.Builder.withReadPolicy(policy).deadline(deadline);
	
	public DatastoreIO() {
		// Get Datastore service with the given configuration
		datastore = DatastoreServiceFactory.getDatastoreService(datastoreConfig);
		blobstore = BlobstoreServiceFactory.getBlobstoreService();
	}
	
	@Override
	public void voegLidToe(Lid lid)  {
		if (!lid.getSpelerscode().equals("") && lid.getSpelerscode() != null) {
			Entity e = new Entity("Lid", lid.getSpelerscode());
			e.setProperty("spelerscode", lid.getSpelerscode());
			e.setProperty("lidnr", lid.getNr());
			e.setProperty("roepnaam", lid.getRoepnaam());
			e.setProperty("tussenvoegsels", lid.getTussenvoegsels());
			e.setProperty("achternaam", lid.getAchternaam());
			e.setProperty("adres", lid.getAdres());
			e.setProperty("postcode", lid.getPostcode());
			e.setProperty("woonplaats", lid.getWoonplaats());
			e.setProperty("telefoon", lid.getTelefoon());
			e.setProperty("email", lid.getEmail());
			e.setProperty("geslacht", lid.getGeslacht());
			Date gebDatum = null;
			try {
				gebDatum = new SimpleDateFormat("yyyy-MM-dd").parse(lid.getGeboortedatum());
			} catch (ParseException ex) {
				// TODO Auto-generated catch block
				ex.printStackTrace();
			}
			e.setProperty("geboortedatum", gebDatum);
			e.setProperty("indiener", lid.getIndiener());
			if (lid.getBlobkey() != null) {
				e.setProperty("blobKeyString", lid.getBlobkey().getKeyString());
			}
			datastore.put(e);
		}
		
	}
	
	@Override
	public void verwijderLid(Lid lid) {
		Key lidKey = KeyFactory.createKey("Lid", lid.getSpelerscode());
		try {
			BlobKey bk = lid.getBlobkey();
			blobstore.delete(bk);
		} catch (NullPointerException e) {}
		datastore.delete(lidKey);
	}
	
	@Override
	// wijzigen in datastore == toevoegen
	public void wijzigLid(Lid lid) {
		voegLidToe(lid);
	}
	
	@Override
	public Lid getLid(String spelerscode)  {
		Lid lid = new Lid();
		Key k = KeyFactory.createKey("Lid", spelerscode);
		Entity res = null;

		try {
			res = datastore.get(k);
			lid.setSpelerscode((String)res.getProperty("spelerscode"));
			long l = (long) res.getProperty("lidnr"); //int wordt opgeslagen als long in datastore :-/
			int lidnummer = (int) l;
			lid.setNr(lidnummer);
			lid.setRoepnaam((String) res.getProperty("roepnaam"));
			lid.setTussenvoegsels((String) res.getProperty("tussenvoegsels"));
			lid.setAchternaam((String) res.getProperty("achternaam"));
			lid.setAdres((String) res.getProperty("adres"));
			lid.setPostcode((String) res.getProperty("postcode"));
			lid.setWoonplaats((String) res.getProperty("woonplaats"));
			lid.setTelefoon((String) res.getProperty("telefoon"));
			lid.setEmail((String) res.getProperty("email"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date gd = (Date) res.getProperty("geboortedatum");
			lid.setGeboortedatum(sdf.format(gd));
			lid.setGeslacht((String) res.getProperty("geslacht"));
			if (res.getProperty("indiener") != null) {
				lid.setIndiener((String) res.getProperty("indiener"));
			}
			if (res.getProperty("blobKeyString") != null) {
				BlobKey bk = new BlobKey((String) res.getProperty("blobKeyString"));
				lid.setBlobkey(bk);
			}
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return lid;
	}
	

	@Override
	public ArrayList<Lid> getLedenlijst() {
		ArrayList<Lid> leden = new ArrayList<Lid>();
		Query q = new Query("Lid")
			.setKeysOnly();
		PreparedQuery pq = datastore.prepare(q);
		
		for (Entity result: pq.asIterable()) {
			Key k = result.getKey();
			Lid lid = new Lid();
			try {
				Entity ent = datastore.get(k);
				lid.setSpelerscode((String) ent.getProperty("spelerscode"));
				long l = (long) ent.getProperty("lidnr");
				int lidnummer = (int) l;
				lid.setNr(lidnummer);
				lid.setRoepnaam((String) ent.getProperty("roepnaam"));
				lid.setTussenvoegsels((String) ent.getProperty("tussenvoegsels"));
				lid.setAchternaam((String) ent.getProperty("achternaam"));
				lid.setAdres((String) ent.getProperty("adres"));
				lid.setPostcode((String) ent.getProperty("postcode"));
				lid.setWoonplaats((String) ent.getProperty("woonplaats"));
				lid.setTelefoon((String) ent.getProperty("telefoon"));
				lid.setEmail((String) ent.getProperty("email"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date gd = (Date) ent.getProperty("geboortedatum");
				lid.setGeboortedatum(sdf.format(gd));
				lid.setGeslacht((String) ent.getProperty("geslacht"));
				if (ent.getProperty("blobKeyString") != null) {
					BlobKey bk = new BlobKey((String) ent.getProperty("blobKeyString"));
					lid.setBlobkey(bk);
				}
			} catch (EntityNotFoundException | NullPointerException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			leden.add(lid);
		}		
		return leden;
	}
	
	@Override
	public void voegTeamToe(Team team) {
		if (!team.getTeamcode().equals("") && team.getTeamcode() != null) {
			Entity ent = new Entity("Team", team.getTeamcode());
			ent.setProperty("teamcode", team.getTeamcode());
			ent.setProperty("teamomschrijving", team.getOmschrijving());
			datastore.put(ent);
		}
	}
	
	@Override
	public void setTeamspeler(Team team, Lid lid) {
		Entity e = new Entity("Teamspeler", team.getTeamcode() + lid.getSpelerscode());
		e.setProperty("teamcode", team.getTeamcode());
		e.setProperty("spelerscode", lid.getSpelerscode());
		datastore.put(e);
	}
	
	@Override
	public void verwijderTeamspeler(Team team, Lid lid) {
		Key k = KeyFactory.createKey("Teamspeler", team.getTeamcode() + lid.getSpelerscode());
		datastore.delete(k);
	}
	

	
	@Override
	public ArrayList<Lid> getTeamspelers(Team team)  {
		ArrayList<Lid> teamleden = new ArrayList<Lid>();
		Filter teamcode =  new FilterPredicate("teamcode", FilterOperator.EQUAL, team.getTeamcode());
		Query q = new Query("Teamspeler").setFilter(teamcode)
				.addSort("spelerscode", SortDirection.ASCENDING)
				.setKeysOnly();
		PreparedQuery pq = datastore.prepare(q);
		
		for (Entity result: pq.asIterable()) {
			Key k = result.getKey();
			
			Lid lid = new Lid();
			try {
				Entity ent = datastore.get(k);
				String spelerscode = (String) ent.getProperty("spelerscode");
				lid = this.getLid(spelerscode);
			} catch (EntityNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			teamleden.add(lid);
		}		
		return teamleden;
	}
	
	@Override
	public ArrayList<Teamspeler> getTeamspelers() {
		ArrayList<Teamspeler> teamspelers = new ArrayList<Teamspeler>();
		Query q = new Query("Teamspeler");
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e: pq.asIterable()) {
			String spelerscode = (String) e.getProperty("spelerscode");
			String teamcode = (String) e.getProperty("teamcode");
			Teamspeler ts = new Teamspeler(spelerscode, teamcode);
			teamspelers.add(ts);
		}
		return teamspelers;
	}
	
	
	@Override
	public ArrayList<Team> getSpelerteams( Lid lid){
		ArrayList<Team> spelerteams = new ArrayList<Team>();
		Filter spelerscode =  new FilterPredicate("spelerscode", FilterOperator.EQUAL, lid.getSpelerscode());
		Query q = new Query("Teamspeler").setFilter(spelerscode);
		PreparedQuery pq = datastore.prepare(q);
		for (Entity result: pq.asIterable()) {
				Team team = this.getTeam( (String) result.getProperty("teamcode"));
				spelerteams.add(team);
		}
		return spelerteams;
	}

	@Override
	public void verwijderTeam(Team team) {
		Key teamKey = KeyFactory.createKey("Team", team.getTeamcode());
		datastore.delete(teamKey);
	}
	
	@Override
	public void wijzigTeam(Team team) {
		voegTeamToe(team);
	}
	
	@Override
	public Team getTeam(String teamcode) {
		Team team = new Team();
		Key k = KeyFactory.createKey("Team", teamcode);
		Entity res = null;
		try {
			res = datastore.get(k);
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			team.setTeamcode((String) res.getProperty("teamcode"));
			team.setOmschrijving((String) res.getProperty("teamomschrijving"));
		return team;
	}
	
	@Override
	public ArrayList<Team> getTeamlijst() {
		ArrayList<Team> teams = new ArrayList<Team>();
		Query q = new Query("Team").addSort("teamcode", SortDirection.ASCENDING);
		PreparedQuery pq = datastore.prepare(q);
		
		for (Entity result: pq.asIterable()) {
			Team team = new Team();
			String tc = (String) result.getProperty("teamcode");
			team.setTeamcode(tc);
			String to = (String) result.getProperty("teamomschrijving");
			team.setOmschrijving(to);
			teams.add(team);
		}
		return teams;
	}

	
}
