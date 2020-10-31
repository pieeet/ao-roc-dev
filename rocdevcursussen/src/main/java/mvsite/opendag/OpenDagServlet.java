package mvsite.opendag;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by Piet de Vries on 28/10/2020.
 */
public class OpenDagServlet extends HttpServlet {
    private static final String CURRENT_OPEN_DAG = "07-11-2020";
    private static final String[] startTimes = {
            "07-11-2020 10:00",
            "07-11-2020 11:00",
            "07-11-2020 12:00",
            "07-11-2020 13:00"
    };

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SimpleDateFormat simpleDateFormatter = new SimpleDateFormat("dd-MM-yyyy HH:mm");
        simpleDateFormatter.setTimeZone(TimeZone.getTimeZone("Europe/Amsterdam"));
        if (req.getParameter("sessie") == null || req.getParameter("opleiding") == null ||
                req.getParameter("email") == null) {
            return;
        }
        String email = req.getParameter("email");
        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
        Entity entity = new Entity("OpenDagVisitor", email);
        entity.setProperty("opleiding", req.getParameter("opleiding"));
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date date = null;
        try {
            date = sdf.parse(CURRENT_OPEN_DAG);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        entity.setProperty("datum", date);
        entity.setProperty("email", email);
        String sessie = req.getParameter("sessie");
        int sessieindex = Integer.parseInt(sessie) -1;
        entity.setProperty("sessie", sessie);
        entity.setProperty("time", new Date());
        datastore.put(entity);
        Date startTime;
        try {
            startTime = simpleDateFormatter.parse(startTimes[sessieindex]);
        } catch (ParseException e) {
            startTime = null;
        }
        Date now = new Date();
        if (startTime.getTime() - now.getTime() > 1000 * 60 * 15) {
            resp.getWriter().print("Bedankt voor je inschrijving. De webinar start: " +
                    startTimes[sessieindex] + " Zorg dat je een Google account hebt om in te kunnen loggen.");
        } else if (now.getTime() - startTime.getTime()  > 1000 * 60 * 20) {
            resp.getWriter().print("De sessie is al beëindigd");
        } else {
            resp.getWriter().print("ok");
        }
    }
}
