package letsencrypt;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Piet de Vries on 26-02-17.
 */
public class LetsEncryptServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.getWriter().print("MjVXmlPGdGIr0Sixg1Tsy7U2K7jl23iQkZAJPSO2Q0c.X2_jOnuY3gaW7OXgUi-VRFgQm2blZCuoGYI4o1lOiyM");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


}