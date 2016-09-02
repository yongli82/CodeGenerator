package {{ project_package }}.api.datas;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

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

    {% for column in columns -%}
    public {{ column.java_type }} get{{ column.java_name|upper0 }}() {
        return {{ column.java_name }};
    }

    public void set{{ column.java_name|upper0 }}({{ column.java_type }} {{ column.java_name }}) {
        this.{{ column.java_name }} = {{ column.java_name }};
    }
    {% endfor %}
    
    @Override
    public String toString(){
        return ToStringBuilder.reflectionToString(this, ToStringStyle.SHORT_PREFIX_STYLE);
    }
}
