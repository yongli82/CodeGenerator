##在sqlmap/sqlmap-config.xml文件中加一行

```
<sqlMap resource="config/sqlmap/{{ data_name }}/{{ data_name }}.xml" />
```

##创建sqlmap文件  config/sqlmap/{{ data_name }}/{{ data_name }}.xml

```sql
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="{{ data_name }}">

    <typeAlias alias="{{ data_name }}Data" type="com.dianping.ba.finance.budget.api.datas.{{ data_name }}Data"/>
    <resultMap id="{{ data_name|lower0 }}Data" class="{{ data_name }}Data">
            {% for column in columns -%}
            <result property="{{ column.java_name }}" column="{{ column.name }}"/>
            {% endfor %}
        </resultMap>

    <insert id="insert{{ data_name }}" parameterClass="map">
        <![CDATA[
            INSERT INTO {{ table_name }} (
            {% for column in columns -%}
            {{ column.name }}{% if not loop.last %},{% endif %}
            {% endfor -%}
        ) VALUES (
            {% for column in columns -%}
            #data.{{ column.java_name }}#{% if not loop.last %},{% endif %}
            {% endfor -%}
        )
        ]]>
    <selectKey resultClass="java.lang.Integer" keyProperty="id">
        <![CDATA[
            SELECT @@IDENTITY AS id
        ]]>
    </selectKey>
    </insert>

    <select id="load{{ data_name }}ById" resultMap="{{ data_name|lower0 }}Data" parameterClass="map">
        SELECT
        {% for column in columns -%}
        {{ column.name }}{% if not loop.last %},{% endif %}
        {% endfor -%}
        FROM {{ table_name }}
        WHERE Id = #id#
    </select>

    <delete id="delete{{ data_name }}ById" parameterClass="map">
        DELETE
        FROM {{ table_name }}
        WHERE Id = #id#
    </delete>

</sqlMap>
```

##创建Data对象： com.dianping.ba.finance.budget.api.datas.{{ data_name }}Data
用IDE自动生成Setter和Getter

```java

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yangyongli
 */
public class {{ data_name }}Data implements Serializable {
    {% for column in columns -%}
    private {{ column.java_type }} {{ column.java_name }};
    {% endfor %}

}
```

##创建DAO接口: 

```java

import com.dianping.avatar.dao.GenericDao;
import com.dianping.avatar.dao.annotation.DAOAction;
import com.dianping.avatar.dao.annotation.DAOActionType;
import com.dianping.avatar.dao.annotation.DAOParam;
import com.dianping.ba.finance.budget.api.datas.{{ data_name }}Data;

public interface {{ data_name }}Dao extends GenericDao {

    @DAOAction(action = DAOActionType.INSERT)
    int insert{{ data_name }}(@DAOParam("data") {{ data_name }}Data data);

    @DAOAction(action = DAOActionType.LOAD)
    {{ data_name }}Data load{{ data_name }}ById(@DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int delete{{ data_name }}ById(@DAOParam("id") int id);
}
```

##创建DAOTest:

```java
import com.dianping.ba.finance.budget.api.datas.{{ data_name }}Data ;
import junit.framework.Assert;
import org.apache.commons.collections.CollectionUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.List;

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
        data.set{{ column.java_name|upper0 }}("");
        {% endfor %}
        int id = {{ data_name|lower0 }}Dao.insert{{ data_name }}(data);
        Assert.assertTrue(id > 0);

        {{ data_name }}Data value = {{ data_name|lower0 }}Dao.load{{ data_name }}ById(id);
        Assert.assertNotNull(value);

        {{ data_name|lower0 }}Dao.delete{{ data_name }}ById(id);
    }
}

```

## 在appcontext-dao-fs.xml中加入

```xml
    <bean id="{{ data_name|lower0 }}Dao" parent="parentDao">
        <property name="proxyInterfaces" value="com.dianping.ba.finance.budget.biz.dao.{{ data_name }}Dao" />
        <property name="target">
            <bean parent="fsMain.daoRealizeTarget">
                <constructor-arg value="{{ data_name}}" />
            </bean>
        </property>
    </bean>
```

## 创建Service接口

```java
import com.dianping.ba.finance.budget.api.datas.{{ data_name}}Data;

import java.util.List;

/**
 * Created by yangyongli
 */
public interface {{ data_name}}Service {

    int insert{{ data_name}}({{ data_name}}Data data);

    {{ data_name}}Data load{{ data_name}}ById(int id);

    int delete{{ data_name}}ById(int id);

}
```

## 创建ServiceObject

```
import com.dianping.ba.finance.budget.api.{{ data_name}}Service;
import com.dianping.ba.finance.budget.api.datas.{{ data_name}}Data;
import com.dianping.ba.finance.budget.biz.dao.{{ data_name}}Dao;
import com.dianping.finance.common.aop.annotation.Log;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yangyongli
 */
public class {{ data_name}}ServiceObject implements {{ data_name}}Service {
    @Autowired
    {{ data_name}}Dao {{ data_name}}Dao;

    @Override
    @Log(logBefore = true, logAfter = true)
    public int insert{{ data_name}}({{ data_name}}Data data) {
        return {{ data_name}}Dao.insert{{ data_name}}(data);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public {{ data_name}}Data load{{ data_name}}ById(int id) {
        return {{ data_name}}Dao.load{{ data_name}}ById(id);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public int delete{{ data_name}}ById(int id) {
        return {{ data_name}}Dao.delete{{ data_name}}ById(id);
    }
}
```

## 配置Service

在biz的appcontext-service.xml中加入

```xml
    <bean id="{{ data_name|lower0 }}Service" class="com.dianping.ba.finance.budget.biz.impl.{{ data_name}}ServiceObject">
    </bean>
```

在service的appcontext-service.xml中加入

```xml
<entry key="http://service.dianping.com/budgetService/{{ data_name }}Service_1.0.0" value-ref="{{ data_name|lower0 }}Service"/>
```

在调用该Service的项目appcontext-client.xml中加入

```xml
    <bean id="{{ data_name|lower0 }}Service" class="com.dianping.dpsf.spring.ProxyBeanFactory" init-method="init">
        <property name="serviceName" value="http://service.dianping.com/budgetService/{{ data_name }}Service_1.0.0" />
        <property name="iface" value="com.dianping.ba.finance.budget.api.{{ data_name }}Service" />
        <property name="serialize" value="hessian" />
        <property name="callMethod" value="sync" />
        <property name="timeoutRetry" value="true"/>
    </bean>
```

