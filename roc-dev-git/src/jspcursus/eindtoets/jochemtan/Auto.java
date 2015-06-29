package jspcursus.eindtoets.jochemtan;

public class Auto {
	   String autonaam, type;
	   int prijs;
	   
	   public Auto(String autonaam, String type, int prijs){
	      
	      this.autonaam = autonaam;
	      this.type = type;
	      this.prijs = prijs;
	   }
	   public String getAutonaam(){
	      return autonaam;
	      
	   }
	   public String getType(){
	      return type;
	   }
	   public int getPrijs(){
	      return prijs;
	   }
}
