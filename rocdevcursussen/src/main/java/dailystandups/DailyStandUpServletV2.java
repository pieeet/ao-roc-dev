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
import java.util.Date;

/**
 * Created by Piet de Vries on 09-03-18.
 *
 */
public class DailyStandUpServletV2 extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;
        if (req.getParameter("vak") != null) {
            if (req.getParameter("vak").equals("")) {
                resp.getWriter().print("<p class=\"error\">Kies een vak</p>");
            } else {
                ArrayList<Ticket> tickets = (ArrayList<Ticket>) DataUtils.getTickets(
                        new Vak(req.getParameter("vak")));
                resp.getWriter().print(makeHtmlSelectorFromTickets(tickets));
            }

        } else {
            PlanningV2 laatstePlanning;
            try {
                laatstePlanning = DataUtils.getPlanningV2(user.getEmail(), true);

            } catch (Exception e) {
                laatstePlanning = null;
            }
            req.setAttribute("planning", laatstePlanning);
            ArrayList<Vak> vakken = DataUtils.getVakken();
            req.setAttribute("vakken", vakken);
            req.setAttribute("fromservlet", "true");
            RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/dailystandups2.jsp");
            disp.forward(req, resp);
        }
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
            StandUpUser standUpUser = new StandUpUser(user.getEmail(), req.getParameter("naam_input"),
                    req.getParameter("groep_kiezer"));
            PlanningV2 nieuwePlanning = new PlanningV2(standUpUser, new Date(), req.getParameter("hulp_nodig"));

            //remove underscores at beginning of string
            String paramTickets = req.getParameter("ticketcodes").substring(2);
            String[] ticketIds = paramTickets.split("__");
            nieuwePlanning.setTicketIds(ticketIds);

            //user wordt hier wél bewaard
            DataUtils.saveUserAndPlanning(nieuwePlanning, laatstePlanningId, true);
            resp.getWriter().print("ok");
        }
    }

    private String makeHtmlSelectorFromTickets(ArrayList<Ticket> tickets) {
        StringBuilder html = new StringBuilder("<select id=\"ticket_selector\" class=\"ignore\">" +
                "<option value=\"Kies\">Kies ticket...</option>");
        for (Ticket ticket: tickets) {
            html.append("<option value=\"").append(ticket.getCodeTicket())
                    .append("\" data-uren=\"").append(ticket.getAantalUren())
                    .append("\" data-code=\"").append(ticket.getCodeTicket())
                    .append("\" data-vak=\"")
                    .append(ticket.getNaamVak()).append("\">")
                    .append(ticket.getCodeTicket()).append(" (").append(ticket.getAantalUren())
                    .append(" punten)").append("</option>");
        }
        html.append("</select>");
        return html.toString();
    }





}

