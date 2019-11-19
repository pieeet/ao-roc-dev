package formtest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

/**
 * Created by Piet de Vries on 14/11/2019.
 */
public class FormTestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        handleRequest(req, resp);
    }

    private void handleRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enumeration<String> parameterNames = req.getParameterNames();
        ArrayList<KeyValue> kvs = new ArrayList<>();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            String[] paramValues = req.getParameterValues(paramName);
            String paramValue = paramValues[0];
            kvs.add(new KeyValue(paramName, paramValue));

        }
        req.setAttribute("kvlist", kvs);
        RequestDispatcher disp = req.getRequestDispatcher("/formtest.jsp");
        disp.forward(req, resp);
    }


}
