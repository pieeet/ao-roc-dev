package dailystandups.model;

/**
 * Created by Piet de Vries on 09-03-18.
 *
 */
public class Ticket {
    private long id;
    private long vakId;
    private String codeTicket;
    private int aantalUren;
    private long isAfgerond;
    private Vak vak;

    public Ticket() {
    }

    public Ticket(long vakId, String codeTicket, int aantalUren) {
        this.vakId = vakId;
        this.codeTicket = codeTicket;
        this.aantalUren = aantalUren;
        isAfgerond = -1;
    }

    public Ticket(long id, long vakId, String codeTicket, int aantalUren, long isAfgerond) {
        this(vakId, codeTicket, aantalUren);
        this.id = id;
        this.isAfgerond = isAfgerond;
    }

    public long getVakId() {
        return vakId;
    }

    public String getCodeTicket() {
        return codeTicket;
    }

    public int getAantalUren() {
        return aantalUren;
    }

    public long getIsAfgerond() {
        return isAfgerond;
    }

    public Vak getVak() {
        return vak;
    }

    public void setVak(Vak vak) {
        this.vak = vak;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTicketRegel() {
        return vak.getNaam() + " - " + codeTicket + " - " + aantalUren + " punten";
    }



}
