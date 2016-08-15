package inleidingJava;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by piet on 15-08-16.
 */
public class DeelKaartenServlet extends HttpServlet {

    DeelKaarten dk;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        dk = new DeelKaarten();
        if (req.getParameter("alle-kaarten") != null) {
            resp.getWriter().print(dk.maakTabel());
        } else if (req.getParameter("enkele-kaart") != null) {
            resp.getWriter().print(dk.deelEnkeleKaart());
        }

    }
}
