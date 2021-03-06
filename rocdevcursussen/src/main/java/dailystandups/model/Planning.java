package dailystandups.model;

import org.apache.commons.lang3.StringEscapeUtils;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.TimeZone;

/**
 * Created by Piet de Vries on 09-03-18.
 *
 */
public class Planning {
    private StandUpUser user;
    private Date entryDate;
    private Ticket[] tickets;
    private long[] ticketIds;
    private String belemmeringen;
    private String redenNietAf;

    //Constructors
    public Planning() {
    }
    public Planning(StandUpUser user, Date entryDate,
                    String belemmeringen) {
        this.user = user;
        this.entryDate = entryDate;
        this.belemmeringen = belemmeringen;
    }

    public void setUser(StandUpUser user) {
        this.user = user;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public void setTickets(Ticket[] tickets) {
        this.tickets = tickets;
    }

    public void setBelemmeringen(String belemmeringen) {
        this.belemmeringen = belemmeringen;
    }

    public StandUpUser getUser() {
        return user;
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

    public Ticket[] getTickets() {
        return tickets;
    }

    public Ticket[] getTicketsSorted() {
        Arrays.sort(tickets, new Comparator<Ticket>() {
            @Override
            public int compare(Ticket o1, Ticket o2) {
                return o1.getTicketRegel().compareTo(o2.getTicketRegel());
            }
        });
        return tickets;
    }

    public String getBelemmeringen() {
        return belemmeringen;
    }
    public String getBelemmeringenEsc() {
        return StringEscapeUtils.escapeHtml4(belemmeringen);
    }

    public String getRedenNietAf() {
        return redenNietAf;
    }
    public String getRedenNietAfEsc() {
        return StringEscapeUtils.escapeHtml4(redenNietAf);
    }

    public void setRedenNietAf(String redenNietAf) {
        this.redenNietAf = redenNietAf;
    }

    public long[] getTicketIds() {
        return ticketIds;
    }

    public void setTicketIds(long[] ticketIds) {
        this.ticketIds = ticketIds;
    }

    public long getId() {
        return entryDate.getTime();
    }

}
