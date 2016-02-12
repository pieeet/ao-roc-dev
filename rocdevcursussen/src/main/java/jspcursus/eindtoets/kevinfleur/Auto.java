package jspcursus.eindtoets.kevinfleur;

/**
*
* @author Kevin
*/
public class Auto {
       private String picture, merk, modelnaam;
       private int prijs;
   
   
   public Auto(String picture, String merk, String modelnaam, int prijs){
       this.picture = picture;
       this.merk = merk;
       this.modelnaam = modelnaam;
       this.prijs = prijs;

   }
   
   public String getPicture()
   {
       return picture;
   }
   
   public String getMerk()
   {
       return merk;
   }
   
   public String getModelnaam()
   {
       return modelnaam;
   }
   
   public int getPrijs()
   {
       return prijs;
   }
   

}