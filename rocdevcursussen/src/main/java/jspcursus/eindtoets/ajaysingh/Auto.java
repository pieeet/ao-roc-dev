package jspcursus.eindtoets.ajaysingh;

/**
*
* @author ajay
*/
public class Auto {
   String merk;
   String type;
   double prijs;
   
   public Auto(String merk, String type, double prijs)
   {
       this.merk = merk;
       this.type = type;
       this.prijs = prijs;
   }

   public String getMerk() 
   {
       return merk;
   }

   public String getType() 
   {
       return type;
   }

   public double getPrijs() 
   {
       return prijs;
   }
   
}