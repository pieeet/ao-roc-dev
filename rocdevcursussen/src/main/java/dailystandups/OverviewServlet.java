package dailystandups;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

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

    private static String[] administrators = {
            "pdevries@roc-dev.com",
            "janjaap@roc-dev.com",
            "tvanbeuningen@roc-dev.com",
            "edirkse@roc-dev.com",
            "test@example.com"
    };

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User user = UserServiceFactory.getUserService().getCurrentUser();
        boolean isAdmin = false;
        for (String admin: administrators) {
           if (admin.equals(user.getEmail())) {
               isAdmin = true;
           }
        }
        if (!isAdmin) {
            resp.sendRedirect("/AO/planning");
            return;
        }
        req.setAttribute("fromserver", true);
        RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/planning_overview.jsp");
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (UserServiceFactory.getUserService().getCurrentUser() == null) return;
        if (req.getParameter("kies_cohort_btn") != null) {
            int cohort = Integer.parseInt(req.getParameter("cohort_kiezer"));
            List<StandUpUser> users = DataUtils.getUsersFromCohortWithLatestPlanning(cohort);
            resp.getWriter().print(maakTabel(users, req));
        }
    }


    private String maakTabel(List<StandUpUser> users, HttpServletRequest req) {
        StringBuilder html = new StringBuilder("<table class=\"table table-bordered table-condensed table-striped\">" +
                "<tr>" +
                "<th>Naam</th>" +
                "<th>Datum/tijd</th>" +
                "<th>Planning</th>" +
                "<th>Hulp nodig</th>" +
                "<th>Voltooid</th>" +
                "<th>Wel gedaan</th>" +
                "<th>Nog te doen</th>" +
                "<th>Reden niet af</th>" +
                "</tr>");

        for (StandUpUser user : users) {
            html.append("<tr>")
                    .append("<td class=\"klik_user\" data-email=\"").append(user.getEmail()).append("\">")
                    .append(user.getNaam()).append("</td>").append("<td>")
                    .append(user.getVorigePlanning().getDateFormat(req.getLocale())).append("</td>")
                    .append("<td>").append(user.getVorigePlanning().getPlanning()).append("</td>")
                    .append("<td>").append(user.getVorigePlanning().getBelemmeringen())
                    .append("</td>").append("<td>").append(user.getVorigePlanning().getAfgerondString())
                    .append("</td>").append("<td>").append(user.getVorigePlanning().getGedaan())
                    .append("</td>").append("<td>").append(user.getVorigePlanning().getNogTeDoen())
                    .append("</td>").append("<td>").append(user.getVorigePlanning().getRedenNietAf())
                    .append("</td>").append("</tr>");
            html.append("<tr>" + "<td>").append("").append("</td>").append("<td>")
                    .append(user.getHuidigePlanning().getDateFormat(req.getLocale())).append("</td>").append("<td>")
                    .append(user.getHuidigePlanning().getPlanning()).append("</td>").append("<td>")
                    .append(user.getHuidigePlanning().getBelemmeringen()).append("</td>").append("<td>")
                    .append(user.getHuidigePlanning().getAfgerondString()).append("</td>").append("<td>")
                    .append(user.getHuidigePlanning().getGedaan()).append("</td>").append("<td>")
                    .append(user.getHuidigePlanning().getNogTeDoen()).append("</td>").append("<td>")
                    .append(user.getHuidigePlanning().getRedenNietAf()).append("</td>")
                    .append("</tr>");
        }
        html.append("</table>");
        return html.toString();

    }
}
