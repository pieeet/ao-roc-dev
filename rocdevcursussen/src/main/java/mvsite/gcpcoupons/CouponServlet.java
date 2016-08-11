package mvsite.gcpcoupons;

import mvsite.gcpcoupons.couponIO.DatastoreIO;
import org.json.JSONArray;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by piet on 12-07-16.
 */
public class CouponServlet extends HttpServlet {
    private static final String[] SCHOOLJAREN = {"2016"};
    private static final String ATTR_NAME_SCHOOLJAREN = "schooljaren";
    private static final String JSP_COUPONS = "/AO/Coupons/coupons.jsp";
    private static final String PARAM_NIEUWE_COUPON = "nieuwe_coupon";
    private static final String PARAM_COUPON_CODE = "coupon_code";
    private static final String PARAM_COUPON_JAAR = "jaar_coupon";
    private static final String PARAM_GET_COUPON = "get_coupon_button";
    private static final String PARAM_SCHOOLJAAR = "schooljaar";
    private static final String EMAIL_DOMEIN = "@roc-dev.com";
    private static final String MSG_NO_COUPON = "Geen coupon gevonden";
    private static final String[] EMAIL_ADMINS = {"pdevries@roc-dev.com", "tvanbeuningen@roc-dev.com ",
            "janjaap@roc-dev.com"};


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String[] schooljaren = SCHOOLJAREN;
        req.setAttribute(ATTR_NAME_SCHOOLJAREN, schooljaren);
        RequestDispatcher disp = req.getRequestDispatcher(JSP_COUPONS);
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        DatastoreIO io = new DatastoreIO();

        //invoer nieuwe coupons
        if (req.getParameter(PARAM_NIEUWE_COUPON) != null) {
            boolean auth = false;
            String username = req.getUserPrincipal().toString();
            for (String emailAdmin: EMAIL_ADMINS) {
                if (username.equals(emailAdmin)) {
                    auth = true;
                    break;
                }
            }
            if (auth) {
                String codeString = req.getParameter(PARAM_COUPON_CODE);
                String[] codes = codeString.split(",");
                int jaar = Integer.parseInt(req.getParameter(PARAM_COUPON_JAAR));
                int i = 1;
                for (String code : codes) {
                    Coupon coupon = new Coupon(jaar, code);
                    io.voegCouponToe(coupon);
                    i++;
                }
                resp.getWriter().print("" + codes.length);
            }

        //haal coupon gebruiker
        } else if (req.getParameter(PARAM_GET_COUPON) != null) {
            int schooljaar = Integer.parseInt(req.getParameter(PARAM_SCHOOLJAAR));
            String username = req.getUserPrincipal().toString();
            int endindex = username.indexOf(EMAIL_DOMEIN);
            username = username.substring(0, endindex);
            Coupon[] coupons = io.getCoupons(schooljaar, username);
            JSONArray jsonArray = new JSONArray();
            if (coupons != null) {
                for (Coupon coupon: coupons) {
                    jsonArray.put(coupon.getCode());
                }
            } else {
                jsonArray.put(MSG_NO_COUPON);
            }
            System.out.println("CouponJson: " + jsonArray.toString());
            resp.getWriter().print(jsonArray.toString());
        }
    }
}
