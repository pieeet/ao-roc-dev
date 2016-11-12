package elance;

import com.google.appengine.api.datastore.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Piet de Vries on 07-11-16.
 */
public class ElanceServlet extends HttpServlet {

    private static final String SERVER_KEY = "AIzaSyAIgCFJpqh8z7oUTu5wxUo0mIoSZUi-SRc";


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("saveToken") != null) {
            String userId = request.getParameter("userId");
            String token = request.getParameter("token");
            DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
            Entity elanceToken = new Entity("ElanceUser", userId);
            elanceToken.setProperty("userId", userId);
            elanceToken.setProperty("token", token);
            datastore.put(elanceToken);
//            response.getWriter().print("SUCCES!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        }

        if (request.getParameter("sendAfspraakInvites") != null) {
            JSONArray deelnemers = null;
            try {
                deelnemers = new JSONArray(request.getParameter("deelnemers"));
            } catch (JSONException e) {
                e.printStackTrace();
            }
            String afspraakId = request.getParameter("afspraakId");
            String locatie = request.getParameter("locatie");
            String tijdString = request.getParameter("tijd");

            if (deelnemers != null) {

                for (int i = 0; i < deelnemers.length(); i++) {
                    try {
                        JSONObject deelnemer = (JSONObject) deelnemers.get(i);
                        String id = deelnemer.getString("id");
                        DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
                        Key key = KeyFactory.createKey("ElanceUser", id);
                        Entity e = datastore.get(key);
                        String token = (String) e.getProperty("token");
                        URL url = new URL("https://fcm.googleapis.com/fcm/send");
                        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                        connection.setDoOutput(true);
                        connection.setRequestMethod("POST");
                        connection.setRequestProperty("Content-Type", "application/json");
                        connection.setRequestProperty("Authorization", "key=" + SERVER_KEY);

                        JSONObject notification = new JSONObject();
                        JSONObject notificationObject = new JSONObject();
                        JSONObject dataObject = new JSONObject();
                        dataObject.put("afspraakId", afspraakId);
                        dataObject.put("locatie", locatie);
                        dataObject.put("tijd", tijdString);

                        notification.put("to", token);
                        notificationObject.put("title", "Nieuwe afspraak");
                        notificationObject.put("body", "Er is een nieuwe afspraak met je gemaakt.");
//                        notification.put("notification", notificationObject);
                        notification.put("data", dataObject);

                        OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
                        writer.write(notification.toString());
                        writer.flush();

                        response.getWriter().print(notification.toString());


                        //display what returns the POST request

                        StringBuilder sb = new StringBuilder();
                        int HttpResult = connection.getResponseCode();
                        if (HttpResult == HttpURLConnection.HTTP_OK) {
                            BufferedReader br = new BufferedReader(
                                    new InputStreamReader(connection.getInputStream(), "utf-8"));
                            String line = null;
                            while ((line = br.readLine()) != null) {
                                sb.append(line + "\n");
                            }
                            br.close();
                            response.getWriter().print(sb.toString());
                        } else {
                            response.getWriter().print((connection.getResponseMessage()));
                            response.getWriter().print((connection.getResponseCode()));
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                }
            }


        }


    }
}