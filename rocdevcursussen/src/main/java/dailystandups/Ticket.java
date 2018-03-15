package dailystandups;

/**
 * Created by Piet de Vries on 09-03-18.
 *
 */
public class Ticket {
    private String naamVak;
    private String codeTicket;
    private int aantalUren;
    private boolean isAfgerond;

    public Ticket(String naamVak, String codeTicket, int aantalUren) {
        this.naamVak = naamVak;
        this.codeTicket = codeTicket;
        this.aantalUren = aantalUren;
        this.isAfgerond = false;
    }

    public String getNaamVak() {
        return naamVak;
    }


    public String getCodeTicket() {
        return codeTicket;
    }

    public int getAantalUren() {
        return aantalUren;
    }

    public boolean isAfgerond() {
        return isAfgerond;
    }

    public void setAfgerond(boolean afgerond) {
        isAfgerond = afgerond;
    }
}
