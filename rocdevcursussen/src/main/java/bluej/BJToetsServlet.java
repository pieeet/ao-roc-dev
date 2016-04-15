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
    private final String TOETS_KNOP_PARAM = "toets_knop";
    private final String USER_PARAM = "user";
    private final String ENTITY_KIND_USER = "BJToets";
    private final String ENTITY_PROP_TOETSNUMMER = "toetsnr";
    private final String TOETS_REQ_ATTRIBUTE = "toets";
    private final String REQUEST_DISPATCHER_URL = "/AO/BlueJ/toets.jsp";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        if (req.getParameter(TOETS_KNOP_PARAM) != null) {
            String user = req.getParameter(USER_PARAM);
            Key k = KeyFactory.createKey(ENTITY_KIND_USER, user);
            int nr;
            try {
                Entity ent = datastore.get(k);
                long l = (long) ent.getProperty(ENTITY_PROP_TOETSNUMMER);
                nr = (int) l;

            } catch (EntityNotFoundException e) {
                nr = new Random().nextInt(toetsen.length);
                Entity ent = new Entity(ENTITY_KIND_USER, user);
                ent.setProperty(this.ENTITY_PROP_TOETSNUMMER, nr);
                ent.setProperty(this.USER_PARAM, user);
                datastore.put(ent);
            }
            String toets = toetsen[nr];
            req.setAttribute(this.TOETS_REQ_ATTRIBUTE, toets);

        }
        RequestDispatcher disp = req.getRequestDispatcher(this.REQUEST_DISPATCHER_URL);
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

}
