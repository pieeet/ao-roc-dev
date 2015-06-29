package jspcursus.eindtoets.marvinvanbakkum;

/**
*
* @author Xyliosius
*/
public class Auto {
   private final String merk;
   private final String model;
   private final int prijs;
   private final String afbeelding;
   
   public Auto(String merk, String model, int prijs) {
       this.merk = merk;
       this.model = model;
       this.prijs = prijs;
       afbeelding = merk + "_" + model;  // \o/
   }
   
   public String getMerk() {
       return merk;
   }
      
   public String getModel() {
       return model;
   }
   
   public String getMerkEnModel() {
       return merk + " " + model;
   }
   
   public String getAfbeelding() {
       return "<img src=\"images/" + afbeelding + ".jpg\">";
   }
   
   public int getPrijs() {
       return prijs;
   }
}
