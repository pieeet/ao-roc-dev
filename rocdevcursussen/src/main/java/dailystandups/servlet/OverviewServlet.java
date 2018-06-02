package dailystandups.servlet;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.util.AuthUtils;
import dailystandups.util.DataUtils;
import dailystandups.model.StandUpUser;
import dailystandups.model.Ticket;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Piet de Vries on 19-02-18.
 *
 */
public class OverviewServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = UserServiceFactory.getUserService().getCurrentUser();
        boolean isAdmin = AuthUtils.isAdmin(user);
        if (!isAdmin) {
            resp.sendRedirect("/AO/planning");
            return;
        }
        req.setAttribute("fromserver", true);
        RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/planning_overview.jsp");
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (UserServiceFactory.getUserService().getCurrentUser() == null) return;
        if (req.getParameter("cohort") != null) {
            int cohort = Integer.parseInt(req.getParameter("cohort"));
            List<StandUpUser> users = DataUtils.getUsersFromCohortWithLatestPlanning(cohort);
            resp.getWriter().print(maakTabel(users));
        }
    }


    private String maakTabel(List<StandUpUser> users) {

        StringBuilder html = new StringBuilder("<table class=\"table table-bordered table-condensed table-striped\">" +
                "<tr>" +
                "<th>Naam/tijd</th>" +
                "<th>Planning</th>" +
                "<th>Hulp nodig</th>" +
                "</tr>");

        for (StandUpUser user : users) {
            List<Ticket> ticketsLaatstePlanning = DataUtils.getTicketsFromPlanning(user.getEmail(),
                    user.getLaatstePlanningId());
            html.append("<tr>").append("<td class=\"klik_user\" data-email=\"").append(user.getEmail()).append("\">")
                    .append(user.getNaamEsc())
                    .append("<br>").append(user.getHuidigePlanning().getEntryDateFormat()).append("</td>")
                    .append("<td>").append(maakTicketString(ticketsLaatstePlanning)).append("</td>")
                    .append("<td>").append(user.getHuidigePlanning().getBelemmeringenEsc()).append("</td>")
                    .append("</tr>");
        }
        html.append("</table>");
        return html.toString();
    }

    private String maakTicketString(List<Ticket> tickets) {
        StringBuilder sb = new StringBuilder();
        for (Ticket ticket : tickets) {
            sb.append(ticket.getTicketRegel()).append("<br><br>");
        }
        return sb.toString();
    }

}
