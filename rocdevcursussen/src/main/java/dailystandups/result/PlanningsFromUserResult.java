package dailystandups.result;

import java.util.List;

/**
 * Created by Piet de Vries on 28/03/2020.
 */
public class PlanningsFromUserResult<K> {

    public String cursor;
    public List<K> result;

    public PlanningsFromUserResult(List<K> result, String cursor) {
        this.result = result;
        this.cursor = cursor;
    }

    public PlanningsFromUserResult(List<K> result) {
        this.result = result;
        this.cursor = null;
    }



}
