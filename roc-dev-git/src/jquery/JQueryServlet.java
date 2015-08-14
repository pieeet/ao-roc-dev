package jquery;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jquery.yahtzee.DatastoreIO;
import jquery.yahtzee.Yahtzee;


@SuppressWarnings("serial")
public class JQueryServlet extends HttpServlet {
	DatastoreIO io; 

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		io = new DatastoreIO();
		
		if (req.getParameter("submit_score_button") != null) {
			String user = req.getParameter("user");
			int score = Integer.parseInt(req.getParameter("score"));
			Date date = new Date();
			Yahtzee yahtzee = new Yahtzee(user, score, date);
			io.voegScoreToe(yahtzee);
			PrintWriter out = resp.getWriter();
			out.print(this.maakScoreLijst());
		}
		else {
			String scoreLijst = this.maakScoreLijst();
			req.setAttribute("scorelijst", scoreLijst);
			RequestDispatcher disp = req.getRequestDispatcher("/AO/clientside/H1/h1_v1.jsp");
			disp.forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	private String maakScoreLijst() {
		ArrayList<Yahtzee> scores = io.getAlleScores();
		ArrayList<Yahtzee> hoogsteScores = new ArrayList<Yahtzee>();
		for (Yahtzee y: scores) {
			ArrayList<Yahtzee> scoresSpeler = new ArrayList<Yahtzee>();
			String naam = y.getGebruikersnaam();
			
		}
		
		Collections.sort(scores, new YahtzeeComparator());
		String html = "";
		if (scores.isEmpty()) {
			html = "<p id=\"yahtzee_leaderboard\">Er zijn nog geen scores</p>";
		} else {
			html = "<table id=\"yahtzee_leaderboard\">";
			html += "<tr><th>nr</th><th>speler</th><th>score</th></tr>";
			int teller = 1;
			for (Yahtzee y: scores) {
				html += "<tr><td>" + teller + "</td></td><td>" + 
						y.getGebruikersnaam() + "</td><td>" + y.getScore() + "</td></tr>";
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
	    	}else if (y1.getScore() > y2.getScore()) {
	    		ret = -1;
	    	}
	        return ret;
	    }
	}
	
	
	

}
