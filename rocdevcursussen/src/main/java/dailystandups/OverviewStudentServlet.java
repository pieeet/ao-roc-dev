package dailystandups;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;

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

    private static String[] administrators = {
            "pdevries@roc-dev.com",
            "janjaap@roc-dev.com",
            "tvanbeuningen@roc-dev.com",
            "edirkse@roc-dev.com",
            "test@example.com"
    };

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;
        boolean isAdmin = false;
        for (String s: administrators) {
            if (user.getEmail().equals(s)) {
                isAdmin = true;
            }
        }
        if (req.getParameter("email") != null) {
            String email = req.getParameter("email");
            if (email.equals(user.getEmail()) || isAdmin) {
                ArrayList<Planning> plannings = DataUtils.getPlanningenFromUser(email);
                req.setAttribute("planningen", plannings);
                RequestDispatcher disp = req
                        .getRequestDispatcher("/AO/daily_standups/planningen_student.jsp");
                disp.forward(req, resp);
            }
        }


    }
}
