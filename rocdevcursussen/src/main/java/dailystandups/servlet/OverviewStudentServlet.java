package dailystandups.servlet;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.model.StandUpUser;
import dailystandups.model.Ticket;
import dailystandups.util.AuthUtils;
import dailystandups.util.DataUtils;
import dailystandups.model.Planning;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

/**
 * Created by Piet de Vries on 23-02-18.
 */
public class OverviewStudentServlet extends HttpServlet {

    private static final String PARAM_EMAIL = "email";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        if (checkLegitUser(req)) {
            String email = req.getParameter(PARAM_EMAIL);
            ArrayList<Planning> plannings = DataUtils.getPlanningenFromUser(email);
            ArrayList<Ticket> tickets = getAfgerondeTickets(plannings);
            StandUpUser sup = DataUtils.getStandUpUser(email);
            req.setAttribute("standupuser", sup);
            req.setAttribute("planningen", plannings);
            req.setAttribute("afgerondetickets", tickets);
            RequestDispatcher disp = req
                    .getRequestDispatcher("/AO/daily_standups/planningen_student.jsp");
            disp.forward(req, resp);
        } else {
            resp.sendRedirect("/AO/planning");
        }

    }


    private ArrayList<Ticket> getAfgerondeTickets(ArrayList<Planning> plannings) {
        ArrayList<Ticket> tickets = new ArrayList<>();
        for (Planning planning : plannings) {
            Ticket[] ticks = planning.getTickets();
            for (Ticket t : ticks) {
                boolean isInList = false;
                for (Ticket ticket : tickets) {
                    if (ticket.getId() == t.getId()) {
                        isInList = true;
                        break;
                    }
                }
                if (!isInList && t.getIsAfgerond() > 0) tickets.add(t);
            }
        }
        if (!tickets.isEmpty()) {
            Collections.sort(tickets, new Comparator<Ticket>() {
                @Override
                public int compare(Ticket o1, Ticket o2) {
                    return o1.getTicketRegel().compareToIgnoreCase(o2.getTicketRegel());
                }
            });
        }
        return tickets;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (checkLegitUser(req)) {
            long ticketId = Long.parseLong(req.getParameter("ticketid"));
            DataUtils.setTicketAfgerond(ticketId, -1, req.getParameter("email"));
            resp.getWriter().print("ok");
        } else resp.getWriter().print("fail");
    }

    private boolean checkLegitUser(HttpServletRequest req) {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user != null && req.getParameter(PARAM_EMAIL) != null) {
            String email = req.getParameter(PARAM_EMAIL);
            return email.equals(user.getEmail()) || AuthUtils.isAdmin(user);
        }
        return false;
    }
}