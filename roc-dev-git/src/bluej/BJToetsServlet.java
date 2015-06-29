package bluej;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class BJToetsServlet extends HttpServlet {
	String[] toetsen = new Toetsen().getToetsen();
	DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		if (req.getParameter("toets_knop") != null) {
			String user = req.getParameter("user");
			Key k = KeyFactory.createKey("BJToets", user);
			int nr;
			try {
				Entity ent = datastore.get(k);
				long l = (long) ent.getProperty("toetsnr");
				nr = (int) l;
				
			} catch (EntityNotFoundException e) {
				nr = new Random().nextInt(toetsen.length);
				Entity ent = new Entity("BJToets", user);
				ent.setProperty("toetsnr", nr);
				ent.setProperty("user", user);
				datastore.put(ent);
			}
			String toets = toetsen[nr];
			req.setAttribute("toets", toets);
			
		}
		RequestDispatcher disp = req.getRequestDispatcher("/AO/BlueJ/toets.jsp");
		disp.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req,resp);
	}

}
