package jspcursus.eindtoets.michelabdad;

import java.text.DecimalFormat;

public class autogegevens {
    public String merk, type, afbeelding;
    public int prijs;

    public autogegevens(String merk, String type, int prijs, String afbeelding) {
        this.merk = merk;
        this.type = type;
        this.prijs = prijs;
        this.afbeelding = afbeelding;
    }

    public String getMerk() {
        return merk;
    }

    public String getType() {
        return type;
    }       

    public int getPrijs() {
        return prijs;
    }
    
    public String getAfbeelding() {
        return afbeelding;
    }
    
    public String getPrijsFormat() {
    	DecimalFormat df = new DecimalFormat("#,##0.--");
    	double prijs = this.getPrijs();
    	String sPrijs = df.format(prijs);
    	return sPrijs;
    }
}
