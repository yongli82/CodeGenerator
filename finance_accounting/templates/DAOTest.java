package {{ project_package }}.biz.dao;

import {{ project_package }}.api.datas.{{ data_name }}Data ;
import junit.framework.Assert;
import org.apache.commons.collections.CollectionUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.List;
import java.util.Date;
import java.math.BigDecimal;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/config/spring/common/appcontext-*.xml",
        "classpath*:/config/spring/local/appcontext-*.xml"})
public class {{ data_name }}DaoTest {

    @Autowired
    private {{ data_name }}Dao {{ data_name|lower0 }}Dao;

    @Test
    public void testInsertLoadDelete() throws Exception {
        {{ data_name }}Data data = new {{ data_name }}Data();
        {% for column in columns -%}
        {% if column.java_name == "id" -%}
        {% elif column.java_type == "int" -%}
        data.set{{ column.java_name|upper0 }}(0);
        {% elif column.java_type == "Date" -%}
        data.set{{ column.java_name|upper0 }}(new Date());
        {% elif column.java_type == "BigDecimal" -%}
        data.set{{ column.java_name|upper0 }}(BigDecimal.ZERO);
        {% elif column.java_type == "String" -%}
        data.set{{ column.java_name|upper0 }}("");
        {% else -%}
        data.set{{ column.java_name|upper0 }}("");
        {% endif %}
        {% endfor %}

        {% if monthly %}
        String monthYear = "201510";
        int id = {{ data_name|lower0 }}Dao.insert{{ data_name }}(monthYear, data);
        Assert.assertTrue(id > 0);

        {{ data_name }}Data value = {{ data_name|lower0 }}Dao.load{{ data_name }}ById(monthYear, id);
        Assert.assertNotNull(value);

        {{ data_name|lower0 }}Dao.delete{{ data_name }}ById(monthYear, id);
        {% else %}
        int id = {{ data_name|lower0 }}Dao.insert{{ data_name }}(data);
        Assert.assertTrue(id > 0);

        {{ data_name }}Data value = {{ data_name|lower0 }}Dao.load{{ data_name }}ById(id);
        Assert.assertNotNull(value);

        {{ data_name|lower0 }}Dao.delete{{ data_name }}ById(id);
        {% endif %}
    }
}
