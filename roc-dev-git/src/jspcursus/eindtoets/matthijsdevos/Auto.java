package jspcursus.eindtoets.matthijsdevos;

/**
*
* @author matthijs
*/
public class Auto {
   private String merk,model;
   private int prijs;

   public Auto(String merk, String model, int prijs) {
       this.merk = merk;
       this.model = model;
       this.prijs = prijs;
   }

   public String getMerk() {
       return merk;
   }

   public void setMerk(String merk) {
       this.merk = merk;
   }

   public String getModel() {
       return model;
   }

   public void setModel(String model) {
       this.model = model;
   }

   public int getPrijs() {
       return prijs;
   }

   public void setPrijs(int prijs) {
       this.prijs = prijs;
   }
   
   /*-------------------------------------------------------------*/
   public String getImage(){
       String pre="<img src='images/";
       String post=".jpg'>";
       
       return pre+getMerk()+"_"+getModel()+post;
   }
   
}
