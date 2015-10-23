package {{ project_package }}.biz.impl;

import {{ project_package }}.api.datas.{{ data_name }}Data;
import {{ project_package }}.api.beans.{{ data_name }}SearchBean;
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

import com.dianping.core.type.PageModel;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/config/spring/common/appcontext-*.xml",
        "classpath*:/config/spring/local/appcontext-*.xml"})
public class {{ data_name }}ServiceTest {

    @Autowired
    private {{ data_name }}Service {{ data_name|lower0 }}Service;

    @Test
    public void testInsertLoadDelete() throws Exception {
        {{ data_name }}Data data = new {{ data_name }}Data();
        {% for column in columns -%}
        {% if column.java_name == "id" -%}
        {% elif column.java_type == "int" or column.java_type == "long" -%}
        data.set{{ column.java_name|upper0 }}(0);
        {% elif column.java_type == "Date" -%}
        data.set{{ column.java_name|upper0 }}(new Date());
        {% elif column.java_type == "BigDecimal" -%}
        data.set{{ column.java_name|upper0 }}(BigDecimal.ZERO);
        {% elif column.java_type == "String" -%}
        data.set{{ column.java_name|upper0 }}("");
        {% else -%}
        data.set{{ column.java_name|upper0 }}("");
        {% endif -%}
        {% endfor %}
        {% if monthly -%}
        String yearMonth = "201510";
        {% endif %}
        int id = {{ data_name|lower0 }}Service.insert{{ data_name }}({% if monthly %}yearMonth, {% endif %}data);
        Assert.assertTrue(id > 0);

        {{ data_name }}Data value = {{ data_name|lower0 }}Service.load{{ data_name }}ById({% if monthly %}yearMonth, {% endif %}id);
        Assert.assertNotNull(value);
        
        int updateRows = {{ data_name|lower0 }}Service.update{{ data_name }}ById({% if monthly %}yearMonth, {% endif %}value);
        Assert.assertEquals(1, updateRows);
        
        {{ data_name }}SearchBean searchBean = new {{ data_name }}SearchBean();
        searchBean.setId(id);
        List<{{ data_name }}Data> list = {{ data_name|lower0 }}Service.query{{ data_name }}({% if monthly %}yearMonth, {% endif %}searchBean);
        Assert.assertNotNull(list);
        Assert.assertEquals("list size is 1", 1, list.size());
        
        PageModel pageModel = {{ data_name|lower0 }}Service.paginate{{ data_name }}({% if monthly %}yearMonth, {% endif %}searchBean, 1, 10);
        Assert.assertNotNull(pageModel);
        Assert.assertEquals("PageModel size is 1", 1, pageModel.getRecordCount());
        
        updateRows = {{ data_name|lower0 }}Service.update{{ data_name }}BySearchBean({% if monthly %}yearMonth, {% endif %}searchBean, value);
        Assert.assertEquals(1, updateRows);

        {{ data_name|lower0 }}Service.delete{{ data_name }}ById({% if monthly %}yearMonth, {% endif %}id);
        
    }
}
