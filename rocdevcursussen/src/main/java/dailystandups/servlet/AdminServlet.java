package dailystandups.servlet;


import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
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
        if (!isAdmin(UserServiceFactory.getUserService().getCurrentUser())) {
            resp.sendRedirect("/AO/planning");
            return;
        }
        ArrayList<Vak> vakken = DataUtils.getVakken();
        req.setAttribute("vakken", vakken);
        RequestDispatcher disp = req.getRequestDispatcher("/AO/daily_standups/admin/admin.jsp");
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (!isAdmin(user)) {
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
    }

    static boolean isAdmin(User user) {
        if (user == null) return false;
        String[] administrators = {
                "pdevries@roc-dev.com",
                "janjaap@roc-dev.com",
                "tvanbeuningen@roc-dev.com",
                "edirkse@roc-dev.com",
                "test@example.com"
        };
        boolean isAdmin = false;
        for (String s: administrators) {
            if (s.equals(user.getEmail())) {
                isAdmin = true;
                break;
            }
        }
        return isAdmin;
    }
}
