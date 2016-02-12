package jspcursus.rekenmachine;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class RekenmachineServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String arg1 = req.getParameter("arg1");
		String arg2 = req.getParameter("arg2");
		String functie = req.getParameter("functie");
		Rekenmachine rm = new Rekenmachine(arg1, arg2, functie);
		PrintWriter out = resp.getWriter();
		out.println("<div id=\"rekenmachine\">");
		out.println("<div id=\"rekenmachine_naam\">");
		out.println("<p>Rekenmachine</p>");
		out.println("</div>");
		out.println("<div class=\"invoer_arg\">");
		out.println("<p>Eerste getal</p>");
		out.println("<input type=\"text\" id=\"arg1\" value=\"" + rm.getUitkomst() + "\">");
		out.println("</div>");
		out.println("<div class=\"invoer_arg\">");
		out.println("<p>Tweede getal</p>");
		out.println("<input type=\"text\" id=\"arg2\" value=\"\">");
		out.println("</div>");
		out.println("<div id=\"reken_knoppen\">");
		out.println("<div class=\"knop_container_2\">");
		out.println("<button type=\"button\" id=\"reken_functie_plus\" value=\"plus\">+</button>");
		out.println("</div>");
		out.println("<div class=\"knop_container_2\">");
		out.println("<button type=\"button\" id=\"reken_functie_min\" value=\"min\">-</button>");
		out.println("</div>");
		out.println("<div class=\"knop_container_2\">");
		out.println("<button type=\"button\" id=\"reken_functie_maal\" value=\"maal\">X</button>");
		out.println("</div>");
		out.println("<div class=\"knop_container_2\">");
		out.println("<button type=\"button\" id=\"reken_functie_delen\" value=\"delen\">/</button>");
		out.println("</div></div>");
		out.println("<p class=\"foutboodschap\">" + rm.getWaarschuwing() + "</p></div>");
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}

}
