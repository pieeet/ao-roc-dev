package dailystandups.util;

import com.google.appengine.api.users.User;

/**
 * Created by Piet de Vries on 02-06-18.
 */
public class AuthUtils {

    public static boolean isAdmin(User user) {
        if (user == null) return false;
        String[] administrators = {
                "pdevries@roc-dev.com",
                "janjaap@roc-dev.com",
                "tvanbeuningen@roc-dev.com",
                "edirkse@roc-dev.com",
                "test@example.com",
                "jschmitz@roc-dev.com",
                "flap@roc-dev.com",
                "iwigger@roc-dev.com"

        };
        boolean isAdmin = false;
        for (String s: administrators) {
            if (s.equals(user.getEmail())) {
                isAdmin = true;
                break;
            }
        }
        return isAdmin;
    }

}
