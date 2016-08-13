package jspcursus.sport;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
import jspcursus.sport.vereniging.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressWarnings("serial")
public class SportServlet extends HttpServlet {

    private static final String PLACEHOLDER_URL = "/AO/JSP_Java_DB/images/geen_foto_thumb.jpg";

    private Administratie admin;

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // check parameters
        if (req.getParameter("nieuwlidform") != null) {
            this.voegNieuwLidToe(req);
            resp.sendRedirect("/sporthtml?leden_overzicht=x&gewijzigd=true");

        } else if (req.getParameter("leden_overzicht") != null) {
            admin = new Administratie();
            ArrayList<Lid> leden = admin.getLedenlijst();
            JSONArray ledenArray = new JSONArray();
            for (Lid lid: leden) {
                String thumbUrl;
                JSONObject lidJsonObject = lid.getlidOverzichtDataAsJSONObject();
                if (lid.getBlobkey() != null ) {
                    thumbUrl = maakThumbServingUrl(lid.getBlobkey());
                } else {
                    thumbUrl = PLACEHOLDER_URL;
                }
                try {
                    lidJsonObject.put("thumbUrl", thumbUrl);
                } catch (JSONException e) {
                    e.printStackTrace();
                }
                ledenArray.put(lidJsonObject);
            }
            System.out.print(ledenArray.toString());
            resp.getWriter().print(ledenArray.toString());
        }


        else if (req.getParameter("verwijderlid") != null) {
            this.verwijderLid(req, resp);
            resp.sendRedirect("/sporthtml?leden_overzicht=x&gewijzigd=true");
        } else if (req.getParameter("wijziglid") != null) {
            this.wijzigLid(req, resp);
            resp.sendRedirect("/sporthtml?leden_overzicht=x&gewijzigd=true");
        } else if (req.getParameter("nieuwteamform") != null) {
            this.voegNieuwTeamToe(req, resp);
            resp.sendRedirect("/sporthtml?teams_overzicht=x&gewijzigd=true");
        } else if (req.getParameter("verwijderteam") != null) {
            this.verwijderTeam(req, resp);
            resp.sendRedirect("/sporthtml?teams_overzicht=x&gewijzigd=true");
        } else if (req.getParameter("wijzigteam") != null) {
            this.wijzigTeam(req, resp);
            resp.sendRedirect("/sporthtml?teams_overzicht=x&gewijzigd=true");
        } else if (req.getParameter("verwijderteamspeler") != null) {
            this.verwijderTeamspeler(req, resp);
        } else if (req.getParameter("voegteamspelertoe") != null) {
            this.voegTeamspelerToe(req, resp);
        } else if (req.getParameter("sql") != null) {
            RequestDispatcher disp = req
                    .getRequestDispatcher("/AO/JSP_Java_DB/deel4JQV2.jsp");
            disp.forward(req, resp);
        } else {
            req.setAttribute("via_servlet", "true");
            RequestDispatcher disp = req
                    .getRequestDispatcher("/AO/JSP_Java_DB/deel4JQV3.jsp");
            disp.forward(req, resp);
        }
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }

    /*************
     * hulpmethoden
     *****************/

    private void voegNieuwLidToe(HttpServletRequest req) {
        if (!req.getParameter("email").trim().equals("")) {
            Lid lid = new Lid(req.getParameter("roepnaam"),
                    req.getParameter("tussenvoegsels"),
                    req.getParameter("achternaam"), req.getParameter("adres"),
                    req.getParameter("postcode"), req.getParameter("woonplaats"),
                    req.getParameter("telefoon"), req.getParameter("email"),
                    req.getParameter("geboortedatum"), req.getParameter("geslacht"));

            if (req.getParameter("gebruiker") != null) {
                lid.setIndiener(req.getParameter("gebruiker"));
            }
            BlobstoreService blobstore = BlobstoreServiceFactory
                    .getBlobstoreService();
            BlobKey bk = null;
            try {
                bk = blobstore.getUploads(req).get("file-0").get(0);
                lid.setBlobkey(bk);
            } catch (NullPointerException e) {
                // e.printStackTrace();
            }
            admin = new Administratie();
            admin.voegLidToe(lid);
        }

    }

    private void verwijderLid(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        String spelerscode = req.getParameter("spelerscode");
        Lid lid = null;
        admin = new Administratie();
        lid = admin.getLid(spelerscode);
        ArrayList<Team> teams = null;
        admin = new Administratie();
        teams = admin.getSpelerteams(lid);
        for (Team team : teams) {
            admin.verwijderTeamspeler(team, lid);
        }
        admin.verwijderLid(lid);

    }

    private void wijzigLid(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        admin = new Administratie();
        Lid lid = admin.getLid(req.getParameter("spelerscode"));
        lid.setNr(lid.getNr());
        lid.setRoepnaam(req.getParameter("roepnaam"));
        lid.setTussenvoegsels(req.getParameter("tussenvoegsels"));
        lid.setAchternaam(req.getParameter("achternaam"));
        lid.setAdres(req.getParameter("adres"));
        lid.setPostcode(req.getParameter("postcode"));
        lid.setWoonplaats(req.getParameter("woonplaats"));
        lid.setTelefoon(req.getParameter("telefoon"));
        lid.setEmail(req.getParameter("email"));
        lid.setGeboortedatum(req.getParameter("geboortedatum"));
        lid.setGeslacht(req.getParameter("geslacht"));
        BlobstoreService blobstore = BlobstoreServiceFactory
                .getBlobstoreService();
        BlobKey bkOud = lid.getBlobkey();
        try {
            BlobKey bkNieuw = blobstore.getUploads(req).get("file-0").get(0);
            if (bkOud != null) {
                blobstore.delete(bkOud);
                lid.setBlobkey(bkNieuw);
            } else if (bkOud == null) {
                lid.setBlobkey(bkNieuw);
            }
            // geen foto geupped er verandert niets
        } catch (NullPointerException e) {
        }
        admin.wijzigLid(lid);

    }

    private void voegNieuwTeamToe(HttpServletRequest req,
                                  HttpServletResponse resp) throws IOException {
        admin = new Administratie();
        String teamcode = req.getParameter("teamcode");
        String teamomschrijving = req.getParameter("teamomschrijving");
        Team team = new Team(teamcode, teamomschrijving);
        admin.voegTeamToe(team);
    }

    private void verwijderTeam(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        Team team = null;
        admin = new Administratie();
        team = admin.getTeam(req.getParameter("teamcode"));
        ArrayList<Lid> teamspelers = null;
        admin = new Administratie();
        teamspelers = admin.getTeamspelers(team);
        for (Lid l : teamspelers) {
            admin.verwijderTeamspeler(team, l);
        }

        admin.verwijderTeam(team);

    }

    private void wijzigTeam(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {
        Team team = null;
        admin = new Administratie();
        team = admin.getTeam(req.getParameter("teamcode"));
        team.setOmschrijving(req.getParameter("teamomschrijving"));
        admin.wijzigTeam(team);
    }

    private void voegTeamspelerToe(HttpServletRequest req,
                                   HttpServletResponse resp) throws IOException, ServletException {
        String teamcode = req.getParameter("teamcode");
        String spelerscode = req.getParameter("spelerscode");
        Lid lid = null;
        admin = new Administratie();
        lid = admin.getLid(spelerscode);
        Team team = null;
        team = admin.getTeam(teamcode);
        admin.setTeamspeler(team, lid);
        resp.sendRedirect("/sporthtml?haal_team_gegevens=x&teamcode="
                + team.getTeamcode());
    }

    private void verwijderTeamspeler(HttpServletRequest req,
                                     HttpServletResponse resp) throws IOException, ServletException {
        Lid lid = null;
        admin = new Administratie();
        lid = admin.getLid(req.getParameter("spelerscode"));
        Team team = admin.getTeam(req.getParameter("teamcode"));
        admin.verwijderTeamspeler(team, lid);
        resp.sendRedirect("/sporthtml?haal_team_gegevens=x&teamcode="
                + team.getTeamcode());
    }

    private String maakThumbServingUrl(BlobKey blobkey) {
        String fotoUrl;
        if (blobkey.equals("")) {
            fotoUrl = PLACEHOLDER_URL;
        } else {
            ImagesService imagesService = ImagesServiceFactory.getImagesService();
            fotoUrl = imagesService
                    .getServingUrl(ServingUrlOptions
                            .Builder
                            .withBlobKey(blobkey)
                            .imageSize(32)
                            .crop(true));
        }
        return fotoUrl;
    }

}
