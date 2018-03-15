package dailystandups;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Created by Piet de Vries on 15-02-18.
 *
 */
public class DailyStandUpServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        Planning laatstePlanning;
        if (user == null) return;
        try {
            laatstePlanning = DataUtils.getPlanning(user.getEmail(), true);
        } catch (Exception e) {
            laatstePlanning = null;
        }
        req.setAttribute("planning", laatstePlanning);
        req.setAttribute("fromservlet", "true");
        RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/dailystandups.jsp");
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;
        Planning laatstePlanning;
        long laatstePlanningId = -1;
        try {
            laatstePlanning = DataUtils.getPlanning(user.getEmail(), true);
            laatstePlanningId = laatstePlanning != null ? laatstePlanning.getDate().getTime() : -1;
        } catch (Exception e) {
            laatstePlanning = null;
        }
        if (req.getParameter("submit_planning_btn") != null) {

            // eerst huidige planning opslaan dan nieuwe planning!!
            if (laatstePlanning != null) {
                laatstePlanning.setAfgerond("Ja".equals(req.getParameter("planning_gehaald")));
                laatstePlanning.setGedaan(req.getParameter("wat_wel_gedaan"));
                laatstePlanning.setNogTeDoen(req.getParameter("wat_nog doen"));
                laatstePlanning.setRedenNietAf(req.getParameter("waarom_niet_gelukt"));
                // user wordt nu nog niet bewaard
                DataUtils.saveUserAndPlanning(laatstePlanning, 0, false);
            }
            Planning nieuwePlanning = new Planning();
            nieuwePlanning.setUser(new StandUpUser(user.getEmail(), req.getParameter("naam_input"),
                    req.getParameter("groep_kiezer")));
            nieuwePlanning.setDate(new Date());
            nieuwePlanning.setPlanning(req.getParameter("plannen_komende_week"));
            nieuwePlanning.setBelemmeringen(req.getParameter("hulp_nodig"));
            //user wordt hier wél bewaard
            DataUtils.saveUserAndPlanning(nieuwePlanning, laatstePlanningId, true);
            resp.getWriter().print("ok");
        }
    }

}
