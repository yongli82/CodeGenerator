package {{ project_package }}.api.beans;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by {{ author }}
 */
public class {{ data_name }}SearchBean implements Serializable {
    {% for column in columns -%}
    private {{ column.java_type }} {{ column.java_name }};
    {% if column.java_type == "Date" -%}
    private {{ column.java_type }} {{ column.java_name }}From;
    private {{ column.java_type }} {{ column.java_name }}To;
    {% endif -%}
    {% endfor %}

    {% for column in columns -%}
     public {{ column.java_type }} get{{ column.java_name|upper0 }}() {
        return {{ column.java_name }};
    }

    public void set{{ column.java_name|upper0 }}({{ column.java_type }} {{ column.java_name }}) {
        this.{{ column.java_name }} = {{ column.java_name }};
    }
    {% if column.java_type == "Date" -%}
    public {{ column.java_type }} get{{ column.java_name|upper0 }}From() {
        return {{ column.java_name }}From;
    }

    public void set{{ column.java_name|upper0 }}From({{ column.java_type }} {{ column.java_name }}From) {
        this.{{ column.java_name }}From = {{ column.java_name }}From;
    }
    
    public {{ column.java_type }} get{{ column.java_name|upper0 }}To() {
        return {{ column.java_name }}To;
    }

    public void set{{ column.java_name|upper0 }}To({{ column.java_type }} {{ column.java_name }}To) {
        this.{{ column.java_name }}To = {{ column.java_name }}To;
    }
    {% endif %}
    {% endfor %}
}
