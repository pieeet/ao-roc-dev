package gerechten.dataIO;

import java.util.ArrayList;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import gerechten.recept.*;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceConfig;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.ReadPolicy;

public class DatastoreIO {
	DatastoreService datastore;
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
		datastore = DatastoreServiceFactory.getDatastoreService(datastoreConfig);
		
	}

	public void voegGerechtToe(Gerecht gerecht) {
		Entity entity = new Entity("Gerecht", gerecht.getNaam());
		entity.setProperty("naam", gerecht.getNaam());
		entity.setProperty("bereidingstijd", gerecht.getBereidingstijd());
		entity.setProperty("bereidingswijze", gerecht.getBereidingswijze());
		datastore.put(entity);
	}

	public ArrayList<Gerecht> getGerechtenLijst() {
		ArrayList<Gerecht> gerechten = new ArrayList<>();
		Query q = new Query("Gerecht");
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e : pq.asIterable()) {
			Gerecht gerecht = new Gerecht();
			gerecht.setNaam((String) e.getProperty("naam"));
			gerecht.setBereidingstijd((int) (long) e
					.getProperty("bereidingstijd"));
			gerecht.setBereidingswijze((String) e
					.getProperty("bereidingswijze"));
			gerechten.add(gerecht);
		}
		return gerechten;
	}

	
	public JSONArray getGerechtenJson() {
		ArrayList<Gerecht> gerechten = this.getGerechtenLijst();
		JSONArray jsonArray = new JSONArray();
		for (Gerecht g: gerechten) {
			jsonArray.put(g.getJSON());
		}
		return jsonArray;
	}

	public void voegProduktToe(Produkt produkt) {
		Entity entity = new Entity("Produkt", produkt.getNaam());
		entity.setProperty("naam_produkt", produkt.getNaam());
		entity.setProperty("maat_eenheid", produkt.getEenheid());
		entity.setProperty("energiePE", produkt.getEnergiePE());
		datastore.put(entity);
	}
	
	public Produkt getProdukt(String naam) {
		Produkt produkt = new Produkt();
		Key k = KeyFactory.createKey("Produkt", naam);
		try {
			Entity e = datastore.get(k);
			produkt.setEnergiePE((double) e.getProperty("energiePE"));
			produkt.setEenheid((String) e.getProperty("maat_eenheid"));
			produkt.setNaam((String) e.getProperty("naam_produkt"));
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return produkt;
	}

	public ArrayList<Produkt> getProduktenLijst() {
		ArrayList<Produkt> produkten = new ArrayList<>();
		Query q = new Query("Produkt");
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e : pq.asIterable()) {
			Produkt produkt = new Produkt();
			produkt.setNaam((String) e.getProperty("naam_produkt"));
			produkt.setEenheid((String) e.getProperty("maat_eenheid"));
			produkt.setEnergiePE((double) e.getProperty("energiePE"));
			produkten.add(produkt);
		}
		return produkten;
	}
	
	public JSONArray getProduktenJson() {
		JSONArray jsonArray = new JSONArray();
		ArrayList<Produkt> produkten = this.getProduktenLijst();
		for (Produkt p: produkten) {
			jsonArray.put(p.getJSON());
		}
		return jsonArray;
	}
	
	public void voegIngredientToe(Ingredient ingredient) {
		Key parent = KeyFactory.createKey("Gerecht", ingredient.getNaamGerecht());
		Entity e = new Entity("Ingredient", ingredient.getNaamProdukt(), parent);
		e.setProperty("gerecht", ingredient.getNaamGerecht());
		e.setProperty("produkt", ingredient.getNaamProdukt());
		e.setProperty("hoeveelheidPP", ingredient.getHoeveelheidPP());
		datastore.put(e);
	}
	
	public ArrayList<Ingredient> getIngredientenLijst(String gerechtnaam) {
		ArrayList<Ingredient> ingredienten = new ArrayList<>();
		Key parent = KeyFactory.createKey("Gerecht", gerechtnaam);
		Query q = new Query("Ingredient").setAncestor(parent);
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e: pq.asIterable()) {
			Ingredient ingredient = new Ingredient();
			ingredient.setNaamGerecht(gerechtnaam);
			ingredient.setNaamProdukt((String) e.getProperty("produkt"));
			ingredient.setHoeveelheidPP((double) e.getProperty("hoeveelheidPP"));
			ingredienten.add(ingredient);
		}
		return ingredienten;
	}
	
	public JSONArray getIngredientenJson(String gerechtnaam) {
		JSONArray jsonArray = new JSONArray();
		ArrayList<Ingredient> ingredienten = this.getIngredientenLijst(gerechtnaam);
		for (Ingredient ingredient: ingredienten) {
			Produkt produkt = this.getProdukt(ingredient.getNaamProdukt());
			JSONObject jso = ingredient.getJSON();
//			JSONObject jso = new JSONObject();
			
			try {
				jso.put("eenheid", produkt.getEenheid());
				
			} catch (JSONException e) {
				e.printStackTrace();
			}
			jsonArray.put(jso);
		}
		return jsonArray;
	}

	public void voegMeeteenheidToe(String meeteenheid) {
		Entity e = new Entity("Meeteenheid", meeteenheid);
		e.setProperty("eenheid", meeteenheid);
		datastore.put(e);
	}

	public ArrayList<String> getMeeteenheden() {
		ArrayList<String> meeteenheden = new ArrayList<>();
		Query q = new Query("Meeteenheid");
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e : pq.asIterable()) {
			meeteenheden.add((String) e.getProperty("eenheid"));
		}
		return meeteenheden;
	}
	
	public JSONArray getNamenMeeteenhedenJson() {
		JSONArray jsonArray = new JSONArray();
		Query q = new Query("Meeteenheid");
		PreparedQuery pq = datastore.prepare(q);
		for (Entity e : pq.asIterable()) {
			JSONObject jsonObject = new JSONObject();
			try {
				jsonObject.put("naam", (String) e.getProperty("eenheid"));
			} catch (JSONException ex) {
				ex.printStackTrace();
			}
			jsonArray.put(jsonObject);
		}
		return jsonArray;
	}

}
