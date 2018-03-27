package dailystandups.servlet;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import dailystandups.model.Ticket;
import dailystandups.util.DataUtils;
import dailystandups.model.Planning;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by Piet de Vries on 23-02-18.
 *
 */
public class OverviewStudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;
        boolean isAdmin = AdminServlet.isAdmin(user);
        if (req.getParameter("email") != null) {
            String email = req.getParameter("email");
            if (email.equals(user.getEmail()) || isAdmin) {
                ArrayList<Planning> plannings = DataUtils.getPlanningenFromUser(email);
                ArrayList<Ticket> tickets = (ArrayList<Ticket>) DataUtils.getAfgerondeTickets(DataUtils
                        .getStandUpUser(user.getEmail()));
                req.setAttribute("planningen", plannings);
                req.setAttribute("afgerondetickets", tickets);
                RequestDispatcher disp = req
                        .getRequestDispatcher("/AO/daily_standups/planningen_student.jsp");
                disp.forward(req, resp);
            }
        }
    }
}
