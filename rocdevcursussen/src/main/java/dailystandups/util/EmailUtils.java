package dailystandups.util;

import dailystandups.model.StandUpUser;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;

/**
 * Created by Piet de Vries on 22-04-18.
 */
public class EmailUtils {

    public static void sendEmailHulpNodig(StandUpUser user, String hulpvraag) {
        try {
            Properties props = new Properties();
            Session session = Session.getDefaultInstance(props, null);
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(
                    "pdevries@roc-dev.com", "Weekly Stand-ups"));
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
                    "admins"));
            msg.setSubject(user.getNaamEsc() + " heeft hulp nodig");
            msg.setText(user.getNaamEsc() + " heeft hulp nodig bij het volgende:\n" + hulpvraag);
            Transport.send(msg);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}