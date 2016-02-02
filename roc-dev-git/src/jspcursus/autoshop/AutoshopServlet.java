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
	final String MERK_PARAM = "merk";
	final String MIN_PRIJS_PARAM = "minprijs";
	final String MAX_PRIJS_PARAM = "maxprijs";
	final String DEFAULT_MERK_PARAM = "alle";
	final String REDIRECT_URL = "/AO/jsp/deel3";

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		if (req.getParameter(MERK_PARAM) == null) {
			resp.sendRedirect(REDIRECT_URL);
		} else {
			try {
				ArrayList<Auto> lijst = new AutoLijst().getLijst();
				String merk = DEFAULT_MERK_PARAM;
				int minPrijs = 0;
				int maxPrijs = Integer.MAX_VALUE;
				if (req.getParameter(MERK_PARAM) != null
						&& !req.getParameter(MERK_PARAM).equals("")) {
					merk = req.getParameter(MERK_PARAM);
				}
				if (!req.getParameter(MIN_PRIJS_PARAM).equals("")) {
					try {
						minPrijs = Integer.parseInt(req
								.getParameter(MIN_PRIJS_PARAM));
					} catch (NumberFormatException | NullPointerException e) {
					}
				}
				if (!req.getParameter(MAX_PRIJS_PARAM).equals("")) {
					try {
						maxPrijs = Integer.parseInt(req
								.getParameter(MAX_PRIJS_PARAM));
					} catch (NumberFormatException | NullPointerException e) {
					}
				}
				PrintWriter out = resp.getWriter();
				if (req.getParameter(MERK_PARAM) != null) {
					if (merk.equals(DEFAULT_MERK_PARAM)) {
						for (Auto auto : lijst) {
							if (auto.getPrijs() > minPrijs
									&& auto.getPrijs() < maxPrijs) {
								out.println(maakAutoDiv(auto));
							}
						}
					} else {
						for (Auto auto : lijst) {
							if (auto.getPrijs() > minPrijs
									&& auto.getPrijs() < maxPrijs
									&& auto.getMerk().equals(merk)) {
								out.println(maakAutoDiv(auto));
							}
						}
					}
				}
				out.close();
			} catch (Exception e) {
				resp.sendRedirect(REDIRECT_URL);
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doGet(req, resp);
	}

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
