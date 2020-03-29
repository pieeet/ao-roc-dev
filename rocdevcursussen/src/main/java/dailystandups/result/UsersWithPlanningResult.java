package dailystandups.result;

import java.util.List;

/**
 * Created by Piet de Vries on 2019-06-20.
 */
public class UsersWithPlanningResult<K> {
    public String cursor;
    public List<K> result;

    public UsersWithPlanningResult(List<K> result, String cursor) {
        this.result = result;
        this.cursor = cursor;
    }

    public UsersWithPlanningResult(List<K> result) {
        this.result = result;
        this.cursor = null;
    }
}
