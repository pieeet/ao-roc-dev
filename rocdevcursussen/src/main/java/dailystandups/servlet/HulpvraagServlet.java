package dailystandups.servlet;

import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserServiceFactory;
import com.google.firebase.database.annotations.NotNull;
import dailystandups.model.Hulpvraag;
import dailystandups.model.Vak;
import dailystandups.util.DataUtils;
import dailystandups.util.EmailUtils;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Piet de Vries on 18/03/2020.
 */
public class HulpvraagServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<Vak> vakken = DataUtils.getVakken();
        ArrayList<Hulpvraag> hulpvragen = DataUtils.getOpenHulpvragen();
        req.setAttribute("vakken", vakken);
        req.setAttribute("vragen", hulpvragen);
        RequestDispatcher disp = req
                .getRequestDispatcher("/AO/daily_standups/hulpvraag.jsp");
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = UserServiceFactory.getUserService().getCurrentUser();
        if (user == null) return;
        if (req.getParameter("submit_hulpvraag") != null) {
            String vak = req.getParameter("vak");
            String hulpvraag = req.getParameter("vraag");
            if (vak == null || hulpvraag == null) return;
            Date date = new Date();
            Hulpvraag hv = new Hulpvraag(0, user.getEmail(), vak, hulpvraag, date, null, null);
            DataUtils.voegHulpvraagToe(hv);
            EmailUtils.sendEmailHulpvraag(user, hulpvraag);
            resp.getWriter().print("ok");
        }
        else if (req.getParameter("delete_hulpvraag") != null) {
            long id = Long.parseLong(req.getParameter("id"));
            try {
                DataUtils.deleteHulpvraag(id, user.getEmail());
                resp.getWriter().print("ok");
            } catch (EntityNotFoundException e) {
                resp.getWriter().print("Hulpvraag niet gevonden in database");
            }
        }

    }
}
