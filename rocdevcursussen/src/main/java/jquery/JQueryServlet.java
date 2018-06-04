package jquery;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.UserServiceFactory;
import jquery.yahtzee.DatastoreIO;
import jquery.yahtzee.Yahtzee;


@SuppressWarnings("serial")
public class JQueryServlet extends HttpServlet {
    DatastoreIO io;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        io = new DatastoreIO();
        String scoreLijst = this.maakScoreLijst();
        req.setAttribute("scorelijst", scoreLijst);
        RequestDispatcher disp = req.getRequestDispatcher("/AO/clientside/H1/h1_v1.jsp");
        disp.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        io = new DatastoreIO();
        //score button handler
        if (req.getParameter("submit_score_button") != null) {
            String user = UserServiceFactory.getUserService().getCurrentUser().getEmail();
            int endindex = user.indexOf("@roc-dev.com");
            if (endindex == -1) {
                // on localhost
                endindex = user.indexOf("@example.com");
            }
            System.out.println(endindex);
            String username = user.substring(0, endindex);
            try {
                int score = Integer.parseInt(req.getParameter("score"));
                if (score > 0 && score <= 375) {
                    Date date = new Date();
                    Yahtzee yahtzee = new Yahtzee(username, score, date);
                    io.voegScoreToe(yahtzee);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            resp.getWriter().print(this.maakScoreLijst());
        }
    }

    private String maakScoreLijst() {
        ArrayList<Yahtzee> scores = io.getAlleScores();
        Collections.sort(scores, new YahtzeeComparator());
        String html = "";
        if (scores.isEmpty()) {
            html = "<p id=\"yahtzee_leaderboard\">Er zijn nog geen scores</p>";
        } else {
            html = "<table id=\"yahtzee_leaderboard\">";
            html += "<tr><th>nr</th><th>speler</th><th>score</th><th>datum</th></tr>";
            int teller = 1;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            for (Yahtzee y : scores) {
                String datum = sdf.format(y.getDatumTijd());
                html += "<tr><td>" + teller + "</td></td><td>" +
                        y.getGebruikersnaamEsc() + "</td><td>" + y.getScoreEsc() + "</td><td>" + datum + "</td></tr>";
                teller++;
            }
            html += "</table>";
        }
        return html;
    }

    //sorteert aflopend (Descending)
    class YahtzeeComparator implements Comparator<Yahtzee> {
        @Override
        public int compare(Yahtzee y1, Yahtzee y2) {
            int ret = 0;
            if (y1.getScore() < y2.getScore()) {
                ret = 1;
            } else if (y1.getScore() > y2.getScore()) {
                ret = -1;
            }
            return ret;
        }
    }
}
