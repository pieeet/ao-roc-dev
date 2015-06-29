package jspcursus.eindtoets.jochemtan;

import java.util.ArrayList;



public class AutoOverzicht {
    private ArrayList<Auto> autolijst;
    String html;
    
    public AutoOverzicht() {
        autolijst = new ArrayList<Auto>(); 
    }
    
    public void voegAutoToe(Auto a) {
  
       autolijst.add(a);
 
    }
    
    
    public ArrayList<Auto> zoekAutoOpPrijs(int min_prijs, int max_prijs) {
      return autolijst;
 
    }
    
     public String zoekAutoOpMerk() {
       html = " <table>\n" +
"            <tr>\n" +
"              \n" +
"               <th>model</th>\n" +
"               <div id=\"prijs\">\n" +
"               <th>prijs</th>\n" +
"               </div>\n" +
"            </tr>\n";
       for(Auto auto : autolijst){
          html +=
"            <td>\n" +
"               <img src=\"images/"+auto.getAutonaam()+"_" + auto.getType()+".jpg\">\n" +
"            </td>\n" +
"            <td>\n" +
"              <p> "+auto.getPrijs()+"</p>\n" +
"            </td>\n" +
"         </table>";
       }
       
      return html;
  
    }
     
     public ArrayList<Auto> getAutolijst() {
       return autolijst;
       
  
    }
}
