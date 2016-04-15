package gerechten;

import gerechten.recept.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import gerechten.dataIO.DatastoreIO;

@SuppressWarnings("serial")
public class VoegGerechtenToeServlet extends HttpServlet {
    DatastoreIO io;

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        io = new DatastoreIO();
        if (req.getParameter("voeg-gerecht-toe-btn") != null) {
            String naam = req.getParameter("naam-gerecht");
            int bereidingstijd;
            try {
                bereidingstijd = Integer.parseInt(req.getParameter("bereidingstijd"));
            } catch (NumberFormatException e) {
                bereidingstijd = -1;
            }
            Gerecht gerecht = new Gerecht(naam,
                    bereidingstijd,
                    req.getParameter("bereidingswijze"));
            io.voegGerechtToe(gerecht);
            JSONArray gerechtnamen = io.getGerechtenJson();
            JSONObject jsonObject = new JSONObject();
            try {
                jsonObject.put("naam", naam);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            gerechtnamen.put(jsonObject);
            resp.getWriter().print(gerechtnamen.toString());
        } else if (req.getParameter("kies-gerecht-btn") != null) {
            String gerecht = req.getParameter("gerecht");
            JSONArray ingredienten = io.getIngredientenJson(gerecht);
            resp.getWriter().print(ingredienten.toString());
        } else if (req.getParameter("voeg-produkt-toe-btn") != null) {
            Produkt produkt = new Produkt();
            String naam = req.getParameter("naam");
            String eenheid = req.getParameter("meeteenheid");
            produkt.setNaam(naam);
            produkt.setEenheid(eenheid);
            double energiePE;
            try {
                energiePE = Double.parseDouble(req.getParameter("energie"));
            } catch (NumberFormatException e) {
                energiePE = -1;
            }
            produkt.setEnergiePE(energiePE);
            io.voegProduktToe(produkt);
            JSONArray produktnamen = io.getProduktenJson();
            JSONObject jsonObject = new JSONObject();
            try {
                jsonObject.put("naam", naam);
                jsonObject.put("eenheid", eenheid);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            produktnamen.put(jsonObject);
            resp.getWriter().print(produktnamen.toString());
        } else if (req.getParameter("voeg-ingredient-toe-btn") != null) {
            Ingredient ingredient = new Ingredient();
            String naamGerecht = req.getParameter("gerecht");
            ingredient.setNaamGerecht(naamGerecht);
            String produkt = req.getParameter("produkt");
            ingredient.setNaamProdukt(produkt);
            double hoeveelheidPP;
            try {
                hoeveelheidPP = Double.parseDouble(req.getParameter("hoeveelheid"));
            } catch (NumberFormatException e) {
                hoeveelheidPP = -1;
            }
            ingredient.setHoeveelheidPP(hoeveelheidPP);
            io.voegIngredientToe(ingredient);
            JSONArray ingredienten = io.getIngredientenJson(naamGerecht);
            resp.getWriter().print(ingredienten.toString());
        } else if (req.getParameter("voeg-meeteenheid-toe-btn") != null) {
            String meeteenheid = req.getParameter("naam-eenheid");
            io.voegMeeteenheidToe(meeteenheid);
            JSONArray meeteenheden = io.getNamenMeeteenhedenJson();
            JSONObject jsonObject = new JSONObject();
            try {
                jsonObject.put("naam", meeteenheid);
            } catch (JSONException e) {
                e.printStackTrace();
            }
            meeteenheden.put(jsonObject);
            resp.getWriter().print(meeteenheden.toString());
        } else {
            ArrayList<Gerecht> gerechten = io.getGerechtenLijst();
            req.setAttribute("gerechten", gerechten);
            ArrayList<Produkt> produkten = io.getProduktenLijst();
            req.setAttribute("produkten", produkten);
            ArrayList<String> meeteenheden = io.getMeeteenheden();
            req.setAttribute("meeteenheden", meeteenheden);
            RequestDispatcher disp = req.getRequestDispatcher("/AO/receptenboek/nieuw-gerecht.jsp");
            try {
                disp.forward(req, resp);
            } catch (ServletException e) {
                e.printStackTrace();
            }
        }

    }

    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        doGet(req, resp);
    }


}
