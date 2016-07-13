package mvsite.gcpcoupons;

/**
 * Created by piet on 12-07-16.
 */
public class Coupon {
    private int schooljaar;
    private String code;
    private String emailUser;


    public Coupon(int schooljaar, String code) {
        this.schooljaar = schooljaar;
        this.code = code;
        this.emailUser = "";
    }

    public Coupon(int schooljaar, String code, String emailUser) {
        this.schooljaar = schooljaar;
        this.code = code;
        this.emailUser = emailUser;
    }


    public int getSchooljaar() {
        return schooljaar;
    }

    public void setSchooljaar(int schooljaar) {
        this.schooljaar = schooljaar;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getEmailUser() {
        return emailUser;
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }
}
