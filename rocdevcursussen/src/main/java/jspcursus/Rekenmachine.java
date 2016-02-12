package jspcursus;

/**
 * Rekenmachine
 *
 * @author ROC Flevoland
 *
 */
public class Rekenmachine {
	double uitkomst = 0;
	
	/**
	 * Geeft uitkomst berekening afhankelijk van functie
	 *@param double arg0
	 *@param double arg1
	 *@param String functie bepaalt welke berekening op de argumenten wordt uitgevoerd
	 *@return double uitkomst berekening
	 */
	public double bereken(double arg0, double arg1, String functie) {
		switch (functie) {
		case "+": uitkomst = arg0 + arg1;
		break;
		
		case "-": uitkomst = arg0 - arg1;
		break;
		
		case "x": uitkomst = arg0 * arg1;
		break;
		
		case "/": uitkomst = arg0 / arg1;
		break;
		}
		return uitkomst;
	}
	

}
