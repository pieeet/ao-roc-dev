package elance;

import com.google.android.gcm.server.Sender;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

/**
 * Created by Piet de Vries on 08-11-16.
 *
 */
class FCMSender extends Sender {

    FCMSender(String key) {
        super(key);
    }

    @Override
    protected HttpURLConnection getConnection(String url) throws IOException {
        String fcmUrl = "https://fcm.googleapis.com/fcm/send";
        return (HttpURLConnection) new URL(fcmUrl).openConnection();
    }


}
