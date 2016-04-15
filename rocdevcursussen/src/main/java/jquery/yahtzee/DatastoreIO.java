package jquery.yahtzee;

import java.util.ArrayList;
import java.util.Date;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;

public class DatastoreIO {
    DatastoreService datastore;

    public static final int ONGEWIJZIGD = 0;
    public static final int GEWIJZIGD = 1;
    public static final int TOEGEVOEGD = 2;

    public DatastoreIO() {
        datastore = DatastoreServiceFactory.getDatastoreService();
    }

    public int voegScoreToe(Yahtzee yahtzee) {
        int ret = ONGEWIJZIGD;
        Key k = KeyFactory.createKey("YahtzeeScores", yahtzee.getGebruikersnaam());
        Entity e = new Entity("YahtzeeScores", yahtzee.getGebruikersnaam());
        try {
            e = datastore.get(k);
            int hoogsteScore = (int) (long) e.getProperty("score");
            int nieuweScore = yahtzee.getScore();
            if (nieuweScore > hoogsteScore) {
                hoogsteScore = nieuweScore;
                e.setProperty("datum", yahtzee.getDatumTijd());
                e.setProperty("score", hoogsteScore);
                datastore.put(e);
                ret = GEWIJZIGD;
            }
        } catch (EntityNotFoundException e1) {
            e.setProperty("datum", yahtzee.getDatumTijd());
            e.setProperty("naam", yahtzee.getGebruikersnaam());
            e.setProperty("score", yahtzee.getScore());
            datastore.put(e);
            ret = TOEGEVOEGD;
        }
        return ret;
    }

    public ArrayList<Yahtzee> getAlleScores() {
        ArrayList<Yahtzee> scores = new ArrayList<Yahtzee>();
        Query q = new Query("YahtzeeScores");
        PreparedQuery pq = datastore.prepare(q);
        for (Entity ent : pq.asIterable()) {
            long l = (long) ent.getProperty("score");
            Yahtzee y = new Yahtzee((String) ent.getProperty("naam"),
                    (int) l,
                    (Date) ent.getProperty("datum"));
            scores.add(y);
        }
        return scores;
    }
}
