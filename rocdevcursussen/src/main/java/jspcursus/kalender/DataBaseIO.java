package jspcursus.kalender;

import java.util.ArrayList;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class DataBaseIO {
	private DatastoreService datastore;
	
	public DataBaseIO() {
		datastore = DatastoreServiceFactory.getDatastoreService();
	}
	
	public Kamer getKamer(String sleutel) throws EntityNotFoundException  {
		Key k = KeyFactory.createKey("Kamer", sleutel);
		
		Entity res = datastore.get(k);
		
		Kamer kamer = new Kamer();
		kamer.setNaam((String) res.getProperty("naam"));
		long l = (long) res.getProperty("prijs");
		int prijs = (int) l;
		kamer.setPrijsPerNacht(prijs);
		return kamer;
	}
	
	public ArrayList<Kamer> getKamerLijst() {
		ArrayList<Kamer> kamerlijst = new ArrayList<Kamer>();
		Query q = new Query("Kamer");
		PreparedQuery pq = datastore.prepare(q);
		for (Entity result: pq.asIterable()) {
			Kamer kamer = new Kamer();
			String naam = (String) result.getProperty("naam");
			kamer.setNaam(naam);
			long l = (long) result.getProperty("prijs");
			int prijs = (int) l;
			kamer.setPrijsPerNacht(prijs);
			kamerlijst.add(kamer);
		}
		return kamerlijst;
	}
	
	public void voegKamerToe(Kamer kamer) {
		String sleutel = kamer.getNaam();
		Entity e = new Entity("Kamer", sleutel);
		e.setProperty("naam", kamer.getNaam());
		e.setProperty("prijs", kamer.getPrijsPerNacht());
		datastore.put(e);
	}
	
	
	public void bewaarReservering(Reservering reservering) {
		Datum datum = reservering.getDatum();
		int dag = datum.getDag();
		int maand = datum.getMaand();
		int jaar = datum.getJaar();
		Kamer kamer = reservering.getKamer();
		Key sleutelParent = KeyFactory.createKey("Kamer", kamer.getNaam() );
		String sleutel = kamer.getNaam() + datum;
		Entity ent = new Entity("Reservering", sleutel, sleutelParent);
	    //ent.setProperty("datum", "" + datum);
	    ent.setProperty("dag", dag);
	    ent.setProperty("maand", maand);
	    ent.setProperty("jaar", jaar);
	    datastore.put(ent);
	}
	
	
	public ArrayList<Datum> getReserveringenVanKamer(Kamer kamer) {
		ArrayList<Datum> data = new ArrayList<Datum>();
		Key parent = KeyFactory.createKey("Kamer", kamer.getNaam());
		Query q = new Query("Reservering").setAncestor(parent);
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e: pq.asIterable()) {
			long dagL = (long) e.getProperty("dag");
			int dag = (int) dagL;
			long maandL = (long) e.getProperty("maand");
			int maand = (int) maandL;
			long jaarL = (long) e.getProperty("jaar");
			int jaar = (int) jaarL;
			Datum datum = new Datum(jaar, maand, dag);
			data.add(datum);
		}
		return data;
		
	}
	
	public ArrayList<Datum> getReserveringenVanKamer(Kamer kamer, int rMaand, int rJaar) {
		ArrayList<Datum> data = new ArrayList<Datum>();
		
		Filter maandFilter = new FilterPredicate("maand",  
				  FilterOperator.EQUAL, 
				  rMaand);
		Filter jaarFilter = new FilterPredicate("jaar",  
				  FilterOperator.EQUAL, 
				  rJaar);
		Filter filter = CompositeFilterOperator.and(maandFilter, jaarFilter);
		Key parent = KeyFactory.createKey("Kamer", kamer.getNaam());
		Query q = new Query("Reservering").setFilter(filter).setAncestor(parent);
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e: pq.asIterable()) {
			long dagL = (long) e.getProperty("dag");
			int dag = (int) dagL;
			long maandL = (long) e.getProperty("maand");
			int maand = (int) maandL;
			long jaarL = (long) e.getProperty("jaar");
			int jaar = (int) jaarL;
			Datum datum = new Datum(jaar, maand, dag);
			data.add(datum);
		}
		return data;
	}

}
