package jspcursus.eindtoets.natashaluyer;

public class Auto {
	   private String merk;
	   private String type;
	   private double prijs;
	   
	   public Auto (String merk, String type, double prijs){
	       this.merk = merk;
	       this.type = type;
	       this.prijs = prijs;
	   }
	   
	   public String getMerk(){
	       return merk;
	   }
	   
	   public String getType(){
	       return type;
	   }
	   
	   public double getPrijs(){
	       return prijs;
	   }
	}
