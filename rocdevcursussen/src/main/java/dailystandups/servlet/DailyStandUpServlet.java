package dailystandups.servlet;

import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.model.*;
import dailystandups.util.DataUtils;
import dailystandups.util.EmailUtils;

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
        // get tickets from "Vak" for selector
        if (req.getParameter("vak") != null) {
            if (req.getParameter("vak").equals("")) {
                resp.getWriter().print("<p class=\"error\">Kies een vak</p>");
            } else {
                long id = Long.parseLong(req.getParameter("vak"));
                ArrayList<Ticket> tickets = (ArrayList<Ticket>) DataUtils.getTicketsFromVak(id);
                resp.getWriter().print(makeHtmlSelectorFromTickets(tickets, user.getEmail()));
            }

        } else {
            Planning laatstePlanning;
            StandUpUser standUpUser;
            try {
                laatstePlanning = DataUtils.getPlanning(user.getEmail());
                standUpUser = laatstePlanning.getUser();
            } catch (Exception e) {
                laatstePlanning = null;
                standUpUser = DataUtils.getStandUpUser(user.getEmail());
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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;

        //Maak custom ticket
        if (req.getParameter("maak_project_ticket") != null) {
            String projectNaam = req.getParameter("project_naam");
            String beschrijvingTicket = req.getParameter("beschrijving_ticket");
            int aantalUur = 0;
            try {
                aantalUur = Integer.parseInt(req.getParameter("aantal_uur"));
            } catch (NumberFormatException ignored) {}
            long vak = 0;
            try {
                vak = Long.parseLong(req.getParameter("vak_id"));
            } catch (NumberFormatException ignored) {}

            ProjectTicket ticket = new ProjectTicket(vak, aantalUur, beschrijvingTicket, projectNaam);
            long ticketId = DataUtils.voegTicketToe(ticket);
            resp.getWriter().print(ticketId);


        }
        // handle update projectticket
        else if (req.getParameter("updateProjectTicket") != null) {
            try {
                ProjectTicket ticket = new ProjectTicket();
                ticket.setId(Long.parseLong(req.getParameter("ticketId")));
                ticket.setProjectNaam(req.getParameter("projectNaam"));
                ticket.setBeschrijvingTicket(req.getParameter("beschrijvingTicket"));
                ticket.setAantalUren(Integer.parseInt(req.getParameter("aantalUur")));
                if (DataUtils.updateProjectTicket(ticket)) {
                    resp.getWriter().print("ok");
                } else {
                    resp.getWriter().print("not ok");
                }
            } catch (NumberFormatException e) {
                resp.getWriter().print("not ok");
            }
        }

        // handle tickets afgerond
        else if (req.getParameter("change_ticket_afgerond") != null) {
            long ticketId = Long.parseLong(req.getParameter("change_ticket_afgerond"));
            String mode = req.getParameter("mode");
            if (mode.equals("set_afgerond")) {
                DataUtils.setTicketAfgerond(ticketId, new Date().getTime(), user.getEmail());
            } else {
                DataUtils.setTicketAfgerond(ticketId, -1, user.getEmail());
            }
            resp.getWriter().print("Ticket met id: " + ticketId + " is gewijzigd");

            // Handle submit
        } else if (req.getParameter("submit_planning_btn") != null) {
            Planning laatstePlanning;
            Date currentDate = new Date();
            try {
                laatstePlanning = DataUtils.getPlanning(user.getEmail());
            } catch (Exception e) {
                laatstePlanning = null;
            }
            // eerst huidige planning opslaan dan nieuwe planning!!
            if (laatstePlanning != null) {
                laatstePlanning.setRedenNietAf(req.getParameter("waarom_niet_gelukt"));
                // user wordt pas bewaard bij nieuwe planning (isNew = false
                DataUtils.saveUserAndPlanning(laatstePlanning, false);
            }
            String groepString = req.getParameter("groep_kiezer");
            Groep groep = null;
            for (Groep g: Groep.values()) {
                if (g.getNaam().equals(groepString)) {
                    groep = g;
                    break;
                }
            }

            StandUpUser standUpUser = new StandUpUser(user.getEmail(), req.getParameter("naam_input"),
                    groep);
            //hulpvraag disabled vanaf 21-03-2020
            String hulpvraag = "";
            if (req.getParameter("hulp_nodig") != null) {
                hulpvraag = req.getParameter("hulp_nodig");
            }
            Planning nieuwePlanning = new Planning(standUpUser, currentDate, hulpvraag);
            //remove underscores at beginning of string
            String paramTickets = req.getParameter("ticketIds").substring(2);
            String[] ticketIdStrings = paramTickets.split("__");
            long[] ticketIds = new long[ticketIdStrings.length];
            for (int i = 0; i < ticketIds.length; i++) {
                ticketIds[i] = Long.parseLong(ticketIdStrings[i]);
            }
            nieuwePlanning.setTicketIds(ticketIds);

            //user wordt hier wél bewaard (isNew = true)
            DataUtils.saveUserAndPlanning(nieuwePlanning, true);
            resp.getWriter().print("ok");

//            [START] Tickets toevoegen aan bestaande planning
        } else if (req.getParameter("addTicket") != null) {
            long planningId = Long.parseLong(req.getParameter("planningId"));
            long ticketId = Long.parseLong(req.getParameter("ticketId"));
            boolean hasTicket = false;
            try {
                Planning planning = DataUtils.getPlanning(user.getEmail());
                for (Ticket ticket: planning.getTickets()) {
                    if (ticket.getId() == ticketId) {
                        resp.getWriter().print("Ticket zit al in je planning");
                        return;
                    }
                }
            } catch (EntityNotFoundException e) {
                e.printStackTrace();
            }
            boolean isToegevoegd = DataUtils.voegTicketAanPlanningToe(user.getEmail(), planningId, ticketId);
            if (isToegevoegd) {
                resp.getWriter().print("ok");
            }
        } else if (req.getParameter("addProjectTicket") != null) {
            String projectnaam = req.getParameter("project_naam");
            String beschrijvingTicket = req.getParameter("beschrijving_ticket");
            int aantalUur = 0;
            try {
                aantalUur = Integer.parseInt(req.getParameter("aantal_uur"));
            } catch (NumberFormatException ignored){}

            long vakId = Long.parseLong(req.getParameter("vak_id"));
            ProjectTicket projectTicket = new ProjectTicket(vakId, aantalUur, beschrijvingTicket, projectnaam);
            long ticketId = DataUtils.voegTicketToe(projectTicket);
            long planningId = Long.parseLong(req.getParameter("planningId"));
            boolean isToegevoegd = DataUtils.voegTicketAanPlanningToe(user.getEmail(), planningId, ticketId);
            if (isToegevoegd) {
                resp.getWriter().print("ok");
            }
        }
    }
//            [END] Tickets toevoegen aan bestaande planning


    private String makeHtmlSelectorFromTickets(ArrayList<Ticket> tickets, String email) {
        long[] afgerondeTickets = DataUtils.getAfgerondeTicketsFromUser(email);

        ArrayList<Ticket> nietAfgerondeTickets = new ArrayList<>();
        for (Ticket ticket: tickets) {
            boolean isAfgerond = false;
            for (long l: afgerondeTickets) {
                if (ticket.getId() == l) {
                    isAfgerond = true;
                    break;
                }
            }
            if (!isAfgerond) {
                nietAfgerondeTickets.add(ticket);
            }
        }
        if (nietAfgerondeTickets.isEmpty()) {
            return "<p>Je hebt alle tickets afgerond</p>";
        } else {
            StringBuilder html = new StringBuilder("<select class=\"form-control\" id=\"ticket_selector\" class=\"ignore\">" +
                    "<option value=\"Kies\">Kies ticket...</option>");
            for (Ticket ticket: nietAfgerondeTickets) {
                html.append("<option value=\"").append(ticket.getCodeTicket())
                        .append("\" data-uren=\"").append(ticket.getAantalUren())
                        .append("\" data-code=\"").append(ticket.getCodeTicket())
                        .append("\" data-ticket_id=\"").append(ticket.getId())
                        .append("\" data-vak_naam=\"").append(ticket.getVak().getNaam())
                        .append("\" data-vak=\"")
                        .append(ticket.getVakId()).append("\">")
                        .append(ticket.getCodeTicket()).append(" - ").append(ticket.getAantalUren()).append(" pnt.")
                        .append("</option>");
            }
            html.append("</select>");
            return html.toString();
        }
    }
}

