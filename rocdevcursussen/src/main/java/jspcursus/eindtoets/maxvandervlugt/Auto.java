package jspcursus.eindtoets.maxvandervlugt;

/**
*
* @author max
*/

//import java.text.DecimalFormat;
public class Auto {
   public String merk, model;
   public int prijs;
  
   public Auto(int prijs, String model, String merk){
       
       this.prijs = prijs;
       this.merk = merk;
       this.model = model;
       
   }
   public int getPrijs(){
      return prijs;
   }
   public String getModel(){
       return model;
   }
   public String getMerk(){
       return merk;
   }
}
