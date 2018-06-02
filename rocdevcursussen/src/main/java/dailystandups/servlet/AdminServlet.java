package dailystandups.servlet;


import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.util.AuthUtils;
import dailystandups.util.DataUtils;
import dailystandups.model.Ticket;
import dailystandups.model.Vak;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by Piet de Vries on 08-03-18.
 *
 */
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (!AuthUtils.isAdmin(user)) {
            resp.sendRedirect("/AO/planning");
            return;
        }

        if (req.getParameter("vak") != null) {
            long id = Long.parseLong(req.getParameter("vak"));
            ArrayList<Ticket> tickets = (ArrayList<Ticket>) DataUtils.getTicketsFromVak(id);
            resp.getWriter().print(maakTicketWijziger(tickets));
        } else {
            ArrayList<Vak> vakken = DataUtils.getVakkenFromDocent(user.getEmail());
            req.setAttribute("vakken", vakken);
            RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/admin/admin.jsp");
            disp.forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (!AuthUtils.isAdmin(user)) {
            resp.sendRedirect("/AO/planning");
            return;
        }
        if (req.getParameter("submit_vak_btn") != null) {
            String naam = req.getParameter("naam_vak_input").trim();
            Vak vak = new Vak(naam, user.getEmail());
            DataUtils.voegVakToe(vak);
            resp.getWriter().print("ok");
        }
        else if (req.getParameter("submit_ticket_btn") != null) {
            long vakId = Long.parseLong(req.getParameter("vak_kiezer"));
            String ticketCode = req.getParameter("ticket_code_input").trim();
            int aantalUren = Integer.parseInt(req.getParameter("ticket_uren_input").trim());
            Ticket ticket = new Ticket(vakId, ticketCode, aantalUren);
            DataUtils.voegTicketToe(ticket);
            resp.getWriter().print("ok");
        }
        else if (req.getParameter("wijzig_vak") != null) {
            String naamVak = req.getParameter("naam_vak");
            long ticketId = Long.parseLong(req.getParameter("vak_id"));
            if (DataUtils.updateVak(new Vak(naamVak, null, ticketId))) resp.getWriter().print("ok");
            else resp.getWriter().print("fail");
        }
        else if (req.getParameter("verwijder_vak") != null) {
            long vakId = Long.parseLong(req.getParameter("vak_id"));
            if (DataUtils.deleteVak(vakId)) resp.getWriter().print("ok");
            else resp.getWriter().print("fail");
        }
        else if (req.getParameter("wijzig_ticket") != null) {
            long ticketId = Long.parseLong(req.getParameter("ticket_id"));
            String codeTicket = req.getParameter("code_ticket");
            int aantalUren = Integer.parseInt(req.getParameter("aantal_uren"));
            Ticket ticket = new Ticket(ticketId, 0, codeTicket, aantalUren, 0);
            if (DataUtils.updateTicket(ticket)) resp.getWriter().print("ok");
            else resp.getWriter().print("fail");
        }
        else if (req.getParameter("verwijder_ticket") != null) {
            long ticketId = Long.parseLong(req.getParameter("ticket_id"));
            if (DataUtils.deleteTicket(ticketId)) resp.getWriter().print("ok");
            else resp.getWriter().print("fail");
        }
    }

    private String maakTicketWijziger(ArrayList<Ticket> tickets) {
        StringBuilder html = new StringBuilder();
        if (tickets.isEmpty()) {
            html.append("<p>Dit vak heeft nog geen tickets</p>");
        } else {
            for (Ticket ticket: tickets) {
                html.append("<div class=\"ticket_wrapper\" data-ticket_id=\"").append(ticket.getId()).append("\">");
                html.append("<label>code</label><br>");
                html.append("<input class=\"form-control input_code\" value=\"").append(ticket.getCodeTicket()).append("\"><br>");
                html.append("<label>uren</label><br>");
                html.append("<input class=\"form-control input_uren\" value=\"").append(ticket.getAantalUren()).append("\"><br>");
                html.append("<button type=\"submit\" class=\"btn btn-primary btn-danger wijzig_ticket_btn\">wijzig</button> ");
                html.append("<button type=\"submit\" class=\"btn btn-primary btn-danger verwijder_ticket_btn\">verwijder</button>");
                html.append("</div>");
            }
        }
        return html.toString();
    }

}
