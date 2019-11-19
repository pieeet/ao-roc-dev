package formtest;

/**
 * Created by Piet de Vries on 14/11/2019.
 */
public class KeyValue {
    String key;
    String value;

    KeyValue(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }
}
