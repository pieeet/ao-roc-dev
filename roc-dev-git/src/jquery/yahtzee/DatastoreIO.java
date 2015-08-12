package jquery.yahtzee;

import java.util.ArrayList;
import java.util.Date;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class DatastoreIO {
	DatastoreService datastore;
	
	public DatastoreIO() {
		datastore = DatastoreServiceFactory.getDatastoreService();
	}
	
	public void voegScoreToe(Yahtzee yahtzee) {
		Entity ent = new Entity("YahtzeeScores", yahtzee.getGebruikersnaam() + yahtzee.getDatumTijd());
		ent.setProperty("datum", yahtzee.getDatumTijd());
		ent.setProperty("naam", yahtzee.getGebruikersnaam());
		ent.setProperty("score", yahtzee.getScore());
		datastore.put(ent);
	}
	
	public ArrayList<Yahtzee> getAlleScores() {
		ArrayList<Yahtzee> scores = new ArrayList<Yahtzee>();
		Query q = new Query("YahtzeeScores");
		PreparedQuery pq = datastore.prepare(q);
		for (Entity ent: pq.asIterable()) {
			long l = (long) ent.getProperty("score");
			Yahtzee y = new Yahtzee( (String) ent.getProperty("naam"), 
					(int) l, 
					(Date) ent.getProperty("datum") );
			scores.add(y);
		}
		return scores;
	}

}
