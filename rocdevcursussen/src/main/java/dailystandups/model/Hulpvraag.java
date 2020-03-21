package dailystandups.model;

import com.google.firebase.database.annotations.NotNull;
import com.google.firebase.database.annotations.Nullable;
import org.apache.commons.lang3.StringEscapeUtils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by Piet de Vries on 18/03/2020.
 */
public class Hulpvraag {
    private long id;
    private String emailUser;
    private String vak;
    private String hulpvraag;
    private Date entryDate;
    private String docent;
    private Date afgehandeld;

    /**
     * Constructor for Hulpvraag
     * @param emailUser
     * @param vak
     * @param hulpvraag
     * @param entryDate
     */
    public Hulpvraag(long id, @NotNull String emailUser, @NotNull String vak, @NotNull String hulpvraag, @NotNull Date entryDate,
                     @Nullable String docent, @Nullable Date afgehandeld) {
        this.id = id;
        this.emailUser = emailUser;
        this.vak = vak;
        this.hulpvraag = hulpvraag;
        this.entryDate = entryDate;
        this.docent = docent;
        this.afgehandeld = afgehandeld;
    }

    public long getId() {
        return id;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public String getVak() {
        return vak;
    }
    public String getVakEsc() {
        return StringEscapeUtils.escapeHtml4(vak);
    }


    public String getHulpvraag() {
        return hulpvraag;
    }
    public String getHulpvraagEsc() {
        return StringEscapeUtils.escapeHtml4(hulpvraag);
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public String getEntryDateFormat() {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm");
            sdf.setTimeZone(TimeZone.getTimeZone("Europe/Amsterdam"));
            return sdf.format(entryDate);
        } catch (Exception e) {
            return "null";
        }
    }

    public String getDocent() {
        return docent;
    }

    public Date getAfgehandeld() {
        return afgehandeld;
    }
}
