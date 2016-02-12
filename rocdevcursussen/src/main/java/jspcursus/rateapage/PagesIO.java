package jspcursus.rateapage;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

public class PagesIO {
	DatastoreService datastore; 
	
	public PagesIO() {
		datastore = DatastoreServiceFactory.getDatastoreService();
	}
	
	public int voegPageToe(Page page) {
		int toegevoegd = 0;
		String url = page.getUrl();
		Entity ent = new Entity("PageRate", url);
		ent.setProperty("url", url);
		
		return toegevoegd;
	}
}
