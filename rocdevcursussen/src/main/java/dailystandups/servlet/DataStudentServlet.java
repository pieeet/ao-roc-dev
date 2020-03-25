package dailystandups.servlet;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.model.Groep;
import dailystandups.model.StandUpUser;
import dailystandups.util.AuthUtils;
import dailystandups.util.DataUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Piet de Vries on 24/03/2020.
 */
public class DataStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (!AuthUtils.isAdmin(user)) return;
        RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/admin/standupuserdata.jsp");


        if (req.getParameter("email") != null) {

            String email = req.getParameter("email");
            if (!email.endsWith("@roc-dev.com")) {
                email += "@roc-dev.com";
            }
            String error = null;
            StandUpUser student = DataUtils.getStandUpUser(email);
            if (student == null) {
                error = "Student met email: " + email + " is niet gevonden.";
            }
            req.setAttribute("student", student);
            req.setAttribute("error", error);
        }
        disp.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("changestudentbtn") != null) {
            String email = req.getParameter("email");
            String naam = req.getParameter("naam");
            String groepnaam = req.getParameter("groep");
            Groep groep = null;
            for (Groep g: Groep.values()) {
                if (g.getNaam().equals(groepnaam)) groep = g;
            }
            int status = Integer.parseInt(req.getParameter("status"));
            StandUpUser standUpUser = new StandUpUser(email, naam, groep, status);
            DataUtils.updateUser(standUpUser);
            resp.sendRedirect("/AO/planning/admin/datastudent");
        }
    }
}
