package dailystandups.servlet;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.model.*;
import dailystandups.util.DataUtils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Logger;

/**
 * Created by Piet de Vries on 09-03-18.
 *
 */
public class DailyStandUpServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(DailyStandUpServlet.class.getName());

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;

        //Maak custom ticket
        if (req.getParameter("maak_project_ticket") != null) {
            String projectNaam = req.getParameter("project_naam");
            String beschrijvingTicket = req.getParameter("beschrijving_ticket");
            int aantalUur = Integer.parseInt(req.getParameter("aantal_uur"));
            long vak = Long.parseLong(req.getParameter("vak_id"));
            ProjectTicket ticket = new ProjectTicket(vak, aantalUur, beschrijvingTicket, projectNaam);
            long ticketId = DataUtils.voegTicketToe(ticket);
            resp.getWriter().print(ticketId);
        // Handle submit
        } else if (req.getParameter("change_ticket_afgerond") != null) {
            long ticketId = Long.parseLong(req.getParameter("change_ticket_afgerond"));
            String mode = req.getParameter("mode");
            if (mode.equals("set_afgerond")) {
                DataUtils.setTicketAfgerond(ticketId, new Date().getTime(), user.getEmail());
            } else {
                DataUtils.setTicketAfgerond(ticketId, -1, user.getEmail());
            }
            resp.getWriter().print("Ticket met id: " + ticketId + " is gewijzigd");
        } else if (req.getParameter("submit_planning_btn") != null) {
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
            }
            StandUpUser standUpUser = new StandUpUser(user.getEmail(), req.getParameter("naam_input"),
                    req.getParameter("groep_kiezer"));
            String hulpvraag = req.getParameter("hulp_nodig");
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
            DataUtils.saveUserAndPlanning(nieuwePlanning, laatstePlanningId, true);
            resp.getWriter().print("ok");
            if (req.getParameter("stuur_email") != null) {
                sendEmailHulpNodig(standUpUser, hulpvraag);
            }
        }
    }

    private String makeHtmlSelectorFromTickets(ArrayList<Ticket> tickets, String email) {
        long[] afgerondeTickets = DataUtils.getAfgerondeTicketsFromUser(email);
        StringBuilder html = new StringBuilder("<select id=\"ticket_selector\" class=\"ignore\">" +
                "<option value=\"Kies\">Kies ticket...</option>");
        for (Ticket ticket : tickets) {
            boolean isAfgerond = false;
            for (long l: afgerondeTickets) {
                if (ticket.getId() == l) {
                    isAfgerond = true;
                }
            }
            if (!isAfgerond) {
                html.append("<option value=\"").append(ticket.getCodeTicket())
                        .append("\" data-uren=\"").append(ticket.getAantalUren())
                        .append("\" data-code=\"").append(ticket.getCodeTicket())
                        .append("\" data-ticket_id=\"").append(ticket.getId())
                        .append("\" data-vak_naam=\"").append(ticket.getVak().getNaam())
                        .append("\" data-vak=\"")
                        .append(ticket.getVakId()).append("\">")
                        .append(ticket.getTicketRegel()).append("</option>");
            }
        }
        html.append("</select>");
        return html.toString();
    }

    private void sendEmailHulpNodig(StandUpUser user, String hulpvraag) {
        try {
            Properties props = new Properties();
            Session session = Session.getDefaultInstance(props, null);
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(
                    "pdevries@roc-dev.com", "Weekly Stand-ups"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
                    "admins"));
            msg.setSubject(user.getNaamEsc() + " heeft hulp nodig");
            msg.setText(user.getNaamEsc() + " heeft hulp nodig bij het volgende:\n" + hulpvraag);
            Transport.send(msg);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }


}

