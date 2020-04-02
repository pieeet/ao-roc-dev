package dailystandups.util;

import com.google.appengine.api.users.User;
import dailystandups.model.Hulpvraag;
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


    public static void sendEmailHulpvraag(User user, Hulpvraag hulpvraag) {
        try {
            InternetAddress[] replyTos = {new InternetAddress(user.getEmail(), user.getEmail())};
            Properties props = new Properties();
            Session session = Session.getDefaultInstance(props, null);
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(
                    "pdevries@roc-dev.com", "ROC-DEV"));
            msg.setReplyTo(replyTos);
            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
                    "admins"));
            msg.setSubject(user.getEmail() + " heeft een hulpvraag ingediend");

            msg.setText(user.getEmail() + " heeft hulp nodig bij het volgende:\n\n" + "vak: " + hulpvraag.getVak() +
                    "\n\n" + hulpvraag.getHulpvraag() + "\n\n" +
                    "Zie https://ao.roc-dev.com/AO/planning/hulpvraag");
            Transport.send(msg);
        } catch (MessagingException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }


}
