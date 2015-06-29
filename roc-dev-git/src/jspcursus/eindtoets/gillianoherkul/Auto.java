package jspcursus.eindtoets.gillianoherkul;

import java.text.DecimalFormat;

public class Auto {
    private final String merk, model, afbeelding;
    private int prijs;
    
    public Auto(String merk, String model, int prijs, String afbeelding)
    {
        this.merk = merk;
        this.model = model;
        this.prijs = prijs;
        this.afbeelding = afbeelding;
    }

    public String getMerk() {
        return merk;
    }

    public String getModel() {
        return model;
    }

    public int getPrijs() {
        return prijs;
    }
    
    public String getAfbeelding()
    {
        return afbeelding;
    }
    
    public String getPrijsFormat() {
    	DecimalFormat df = new DecimalFormat("#,##0.--");
    	double prijs = this.getPrijs();
    	String sPrijs = df.format(prijs);
    	return sPrijs;
    }
}
