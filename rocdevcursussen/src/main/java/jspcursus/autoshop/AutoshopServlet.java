package jspcursus.autoshop;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class AutoshopServlet extends HttpServlet {


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		final String PARAM_MERK = "merk";
		final String PARAM_MIN_PRIJS = "minprijs";
		final String PARAM_MAX_PRIJS = "maxprijs";
		final String REDIRECT_URL = "/AO/jsp/deel3";

		if (req.getParameter(PARAM_MERK) == null) {
			resp.sendRedirect(REDIRECT_URL);
		} else {
			String merk = req.getParameter(PARAM_MERK);
			String invoerMinPrijs = req.getParameter(PARAM_MIN_PRIJS);
			String invoerMaxPrijs = req.getParameter(PARAM_MAX_PRIJS);
			ArrayList<Auto> lijst = DataUtils.getAutosGefilterd(merk, invoerMinPrijs, invoerMaxPrijs);
			PrintWriter out = resp.getWriter();
			for (Auto auto: lijst) {
				out.print(maakAutoDiv(auto));
			}
			out.close();
		}
	}

	// maakt de html voor een auto-div om async naar client te sturen
	private String maakAutoDiv(Auto auto) {
		String div = "<div class=\"autokader\">\n";
		div += "<img src=\"" + auto.getFoto() + "\" alt=\"" + auto.getMerk()
				+ " " + auto.getType() + "\">\n";
		div += "<p class=\"merktype\">" + auto.getMerk() + " " + auto.getType()
				+ "</p>\n";
		div += "<p class=\"prijs\">&euro; " + auto.getPrijsFormat() + "</p>\n";
		div += "</div>\n";
		return div;
	}

}
