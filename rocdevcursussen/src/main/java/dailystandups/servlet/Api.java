package dailystandups.servlet;

import dailystandups.util.ApiKeys;
import dailystandups.util.DataUtils;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Piet de Vries on 10/09/2020.
 */
public class Api extends HttpServlet {

    private static final String PARAM_API_KEY = "key";
    private static final String PARAM_COHORT = "cohort";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter(PARAM_API_KEY) != null) {
            String key = req.getParameter(PARAM_API_KEY);
            if (!ApiKeys.validate(key)) {
                resp.getWriter().print("authentication failure");
                return;
            }
        } else return;
//        enable cors
        resp.addHeader("Access-Control-Allow-Origin", "*");
        resp.addHeader("Content-Type", "text/json");
        try {
            int cohort = Integer.parseInt(req.getParameter(PARAM_COHORT));
            try {
                JSONObject jso = DataUtils.getPlanningenFromCohort(cohort);
                resp.getWriter().print(jso.toString());
            } catch (JSONException e) {
                resp.getWriter().print("Er is iets misgegaan.");
            }
        } catch (NumberFormatException e) {
            resp.getWriter().print("parameter cohort niet correct");
        }
    }
}
