package dailystandups.servlet;

import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.model.*;
import dailystandups.util.DataUtils;

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
public class DailyStandUpServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;
        if (req.getParameter("vak") != null) {
            if (req.getParameter("vak").equals("")) {
                resp.getWriter().print("<p class=\"error\">Kies een vak</p>");
            } else {
                long id = Long.parseLong(req.getParameter("vak"));
                ArrayList<Ticket> tickets = (ArrayList<Ticket>) DataUtils.getTicketsFromVak(id);
                resp.getWriter().print(makeHtmlSelectorFromTickets(tickets));
            }

        } else {
            Planning laatstePlanning;
            StandUpUser standUpUser;
            try {
                laatstePlanning = DataUtils.getPlanning(user.getEmail());
                standUpUser = laatstePlanning.getUser();
            } catch (Exception e) {
                laatstePlanning = null;
                try {
                    standUpUser = DataUtils.getStandUpUser(user.getEmail());
                } catch (EntityNotFoundException e1) {
                    standUpUser = null;
                }
            }
            req.setAttribute("planning", laatstePlanning);
            req.setAttribute("standupuser", standUpUser);
            ArrayList<Vak> vakken = DataUtils.getVakken();
            req.setAttribute("vakken", vakken);
            req.setAttribute("fromservlet", "true");
            RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/dailystandups.jsp");
            disp.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;

        if (req.getParameter("maak_project_ticket") != null) {
            String projectNaam = req.getParameter("project_naam");
            String beschrijvingTicket = req.getParameter("beschrijving_ticket");
            int aantalUur = Integer.parseInt(req.getParameter("aantal_uur"));
            long vak = Long.parseLong(req.getParameter("vak_id"));
            ProjectTicket ticket = new ProjectTicket(vak, aantalUur, beschrijvingTicket, projectNaam);
            long ticketId = DataUtils.voegTicketToe(ticket);
            System.out.println("Projectnaam: " + projectNaam);
            System.out.println("Beschrijving ticket: " + beschrijvingTicket);
            System.out.println("Aantal uur: " + aantalUur);
            System.out.println("Vak Id: " + vak);
            System.out.println("Ticket Id: " + ticketId);
            resp.getWriter().print(ticketId);
        }

        else if (req.getParameter("submit_planning_btn") != null) {
            Planning laatstePlanning;
            long laatstePlanningId = -1;
            Date currentDate = new Date();
            try {
                laatstePlanning = DataUtils.getPlanning(user.getEmail());
                laatstePlanningId = laatstePlanning != null ? laatstePlanning.getId() : -1;
            } catch (Exception e) {
                laatstePlanning = null;
            }
            // eerst huidige planning opslaan dan nieuwe planning!!
            if (laatstePlanning != null) {
                laatstePlanning.setRedenNietAf(req.getParameter("waarom_niet_gelukt"));
                // user wordt pas bewaard bij nieuwe planning (isNew = false
                DataUtils.saveUserAndPlanning(laatstePlanning, 0, false);
                // set tickets afgerond
                if (req.getParameter("ticketsAfgerond") != null) {
                    String paramTicketsAfgerond = req.getParameter("ticketsAfgerond").substring(2);
                    String[] afgerondeTicketIds = paramTicketsAfgerond.split("__");
                    for (String ticket: afgerondeTicketIds) {
                        long id = Long.parseLong(ticket);
                        DataUtils.setTicketAfgerond(id, currentDate, user.getEmail());
                    }
                }
            }
            StandUpUser standUpUser = new StandUpUser(user.getEmail(), req.getParameter("naam_input"),
                    req.getParameter("groep_kiezer"));
            Planning nieuwePlanning = new Planning(standUpUser, currentDate, req.getParameter("hulp_nodig"));

            //remove underscores at beginning of string
            String paramTickets = req.getParameter("ticketIds").substring(2);
            String[] ticketIdStrings = paramTickets.split("__");
            long[] ticketIds = new long[ticketIdStrings.length];
            for (int i = 0; i < ticketIds.length; i++) {
                ticketIds[i] = Long.parseLong(ticketIdStrings[i]);
            }
            nieuwePlanning.setTicketIds(ticketIds);

            //user wordt hier wél bewaard (isNew = true)
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
                    .append("\" data-ticket_id=\"").append(ticket.getId())
                    .append("\" data-vak_naam=\"").append(ticket.getVak().getNaam())
                    .append("\" data-vak=\"")
                    .append(ticket.getVakId()).append("\">")
                    .append(ticket.getTicketRegel()).append("</option>");
        }
        html.append("</select>");
        return html.toString();
    }





}

