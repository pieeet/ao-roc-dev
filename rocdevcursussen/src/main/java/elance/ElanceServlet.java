package elance;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
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
 *
 */
public class ElanceServlet extends HttpServlet {


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

        if (request.getParameter("sendInvite") != null) {
            final String serverKey = "AIzaSyAIgCFJpqh8z7oUTu5wxUo0mIoSZUi-SRc";
            URL url = new URL("https://fcm.googleapis.com/fcm/send");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setRequestProperty("Authorization", "key=" + serverKey);

            JSONObject notification = new JSONObject();
            JSONObject notificationObject = new JSONObject();
            String token = "cCBOJKfEWOI:APA91bH0A0xhgry58k_C2gYZF8p8-htaf_Hwe_7A7K4y9AadThy-rvrkwlmtLLjhniZ0RCmi6p178qjoKJd0ZUbaCpgcJzVVDeS-vPpANYSe4EE1w6UjV63XpnEUtz1jIXiLNkulYifi";
            try {
                notification.put("to", token);
                notificationObject.put("title", "Nieuwe afspraak");
                notificationObject.put("body", "... heeft afspraak gemaakt");
                notification.put("notification", notificationObject);

                OutputStreamWriter wr = new OutputStreamWriter(connection.getOutputStream());
                wr.write(notification.toString());
                wr.flush();

                response.getWriter().print(notification.toString());
            } catch (JSONException e) {
                e.printStackTrace();
            }

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



//            try {
//                Sender sender = new FCMSender(serverKey);
//                Message message = new Message.Builder()
//                        .collapseKey("message")
//                        .timeToLive(3)
//                        .delayWhileIdle(true)
//                        .addData("message", "Notification from Java application")
//
//                        .build();
//
//                // Use the same token(or registration id) that was earlier
//                // used to send the message to the client directly from
//                // Firebase Console's Notification tab.
//                Result result = sender.send(message,
//                        "d9HF-JtETgk:APA91bGUH7g8d1Nq-Eo5HLXX8LCUPw6dPxvLhP0bZ8dn845SdvpQspV2GlQCPCEImNQRBCuXaeRXPNed1FYduQuhPkvWyA73Eza8A6KMFlAlRa_faZGhjQQuCCSe9Ti8lrQg-O-FoYlJ",
//                        1);
//                //System.out.println("Result: " + result.toString());
//                response.getWriter().print(result.toString());
//            } catch (Exception e) {
//                e.printStackTrace();
//            }


        }


    }
}