import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by {{ author }}
 */
public class {{ data_name }}Data implements Serializable {
    {% for column in columns -%}
    private {{ column.java_type }} {{ column.java_name }};
    {% endfor %}

}
