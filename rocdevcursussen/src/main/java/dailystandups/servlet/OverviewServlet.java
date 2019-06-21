package dailystandups.servlet;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.model.ProjectTicket;
import dailystandups.model.UsersWithPlanningResult;
import dailystandups.util.AuthUtils;
import dailystandups.util.DataUtils;
import dailystandups.model.StandUpUser;
import dailystandups.model.Ticket;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
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
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (AuthUtils.isAdmin(user)) {
            if (req.getParameter("cohort") != null || req.getParameter("groep") != null) {
                String cursorStart = req.getParameter("cursor");
                if (cursorStart.equals("init")) cursorStart = null;
                UsersWithPlanningResult<StandUpUser> result;
                if (req.getParameter("cohort") != null) {
                    int cohort = Integer.parseInt(req.getParameter("cohort"));
                    result = DataUtils
                            .getUsersWithLatestPlanning(cohort, null, cursorStart);
                } else {
                    String groep = req.getParameter("groep");
                    result = DataUtils
                            .getUsersWithLatestPlanning(0, groep, cursorStart);
                }
                ArrayList<StandUpUser> users = (ArrayList<StandUpUser>) result.result;
                String cursorNew = "null";
                if (result.cursor != null) cursorNew = result.cursor;
                String rows = maakTabelRows(users);
                JSONObject jso = new JSONObject();
                try {
                    jso.put("rows", rows);
                    jso.put("cursor", cursorNew);
                    resp.getWriter().print(jso.toString());
                } catch (JSONException e) {
                    e.printStackTrace();
                    resp.getWriter().print("error");
                }
            } else if (req.getParameter("ticketId") != null) {
                try {
                    long ticketId = Long.parseLong(req.getParameter("ticketId"));
                    // returns the first admin that approved the ticket
                    String admin = DataUtils.approveTicket(ticketId, user.getEmail());
                    if (admin != null) {
                        resp.getWriter().print(admin);
                        return;
                    }
                } catch (NumberFormatException ignored) {}
                // something went wrong
                resp.getWriter().print("not good");
            }
        }
    }

    private String maakTabelRows(List<StandUpUser> users) {
        StringBuilder html = new StringBuilder();
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
        return html.toString();
    }

    private String maakTicketString(List<Ticket> tickets) {
        StringBuilder sb = new StringBuilder();
        for (Ticket ticket : tickets) {
            sb.append(ticket.getTicketRegel()).append("<br>");
            if (ticket instanceof ProjectTicket && ((ProjectTicket) ticket).getApproved()!= null) {
                if (((ProjectTicket) ticket).getApproved().equals("pending")) {
                    sb.append("<button type=\"button\" class=\"approve-ticket btn btn-primary btn-warning btn-sm\" data-ticketid = \"");
                    sb.append(ticket.getId()).append("\">geef akkoord</button><br>");
                } else {
                    sb.append("<p>akkoord: ").append(((ProjectTicket) ticket).getApproved()).append("</p>");
                }
            }
            sb.append("<br>");
        }
        return sb.toString();
    }

}
