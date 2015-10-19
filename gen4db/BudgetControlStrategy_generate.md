##在sqlmap/sqlmap-config.xml文件中加一行

```
<sqlMap resource="config/sqlmap/BudgetControlStrategy/BudgetControlStrategy.xml" />
```

##创建sqlmap文件  config/sqlmap/BudgetControlStrategy/BudgetControlStrategy.xml

```sql
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="BudgetControlStrategy">

    <typeAlias alias="BudgetControlStrategyData" type="com.dianping.ba.finance.budget.api.datas.BudgetControlStrategyData"/>
    <resultMap id="budgetControlStrategyData" class="BudgetControlStrategyData">
            <result property="id" column="Id"/>
            <result property="periodType" column="PeriodType"/>
            <result property="duration" column="Duration"/>
            <result property="limitType" column="LimitType"/>
            <result property="algorithmType" column="AlgorithmType"/>
            <result property="algorithmPercent" column="AlgorithmPercent"/>
            <result property="controlProperty" column="ControlProperty"/>
            <result property="recordStatus" column="RecordStatus"/>
            <result property="updateTime" column="UpdateTime"/>
            <result property="addTime" column="AddTime"/>
            <result property="addLoginId" column="AddLoginId"/>
            <result property="updateLoginId" column="UpdateLoginId"/>
            
        </resultMap>

    <insert id="insertBudgetControlStrategy" parameterClass="map">
        <![CDATA[
            INSERT INTO FC_BudgetControlStrategy (
            Id,
            PeriodType,
            Duration,
            LimitType,
            AlgorithmType,
            AlgorithmPercent,
            ControlProperty,
            RecordStatus,
            UpdateTime,
            AddTime,
            AddLoginId,
            UpdateLoginId
            ) VALUES (
            #data.id#,
            #data.periodType#,
            #data.duration#,
            #data.limitType#,
            #data.algorithmType#,
            #data.algorithmPercent#,
            #data.controlProperty#,
            #data.recordStatus#,
            #data.updateTime#,
            #data.addTime#,
            #data.addLoginId#,
            #data.updateLoginId#
            )
        ]]>
    <selectKey resultClass="java.lang.Integer" keyProperty="id">
        <![CDATA[
            SELECT @@IDENTITY AS id
        ]]>
    </selectKey>
    </insert>

    <select id="loadBudgetControlStrategyById" resultMap="budgetControlStrategyData" parameterClass="map">
        SELECT
        Id,
        PeriodType,
        Duration,
        LimitType,
        AlgorithmType,
        AlgorithmPercent,
        ControlProperty,
        RecordStatus,
        UpdateTime,
        AddTime,
        AddLoginId,
        UpdateLoginId
        FROM FC_BudgetControlStrategy
        WHERE Id = #id#
    </select>

    <delete id="deleteBudgetControlStrategyById" parameterClass="map">
        DELETE
        FROM FC_BudgetControlStrategy
        WHERE Id = #id#
    </delete>

</sqlMap>
```

##创建Data对象： com.dianping.ba.finance.budget.api.datas.BudgetControlStrategyData
用IDE自动生成Setter和Getter

```java

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yangyongli
 */
public class BudgetControlStrategyData implements Serializable {
    private int id;
    private int periodType;
    private int duration;
    private int limitType;
    private int algorithmType;
    private BigDecimal algorithmPercent;
    private int controlProperty;
    private int recordStatus;
    private Date updateTime;
    private Date addTime;
    private int addLoginId;
    private int updateLoginId;
    

}
```

##创建DAO接口: 

```java

import com.dianping.avatar.dao.GenericDao;
import com.dianping.avatar.dao.annotation.DAOAction;
import com.dianping.avatar.dao.annotation.DAOActionType;
import com.dianping.avatar.dao.annotation.DAOParam;
import com.dianping.ba.finance.budget.api.datas.BudgetControlStrategyData;

public interface BudgetControlStrategyDao extends GenericDao {

    @DAOAction(action = DAOActionType.INSERT)
    int insertBudgetControlStrategy(@DAOParam("data") BudgetControlStrategyData data);

    @DAOAction(action = DAOActionType.LOAD)
    BudgetControlStrategyData loadBudgetControlStrategyById(@DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int deleteBudgetControlStrategyById(@DAOParam("id") int id);
}
```

##创建DAOTest:

```java
import com.dianping.ba.finance.budget.api.datas.BudgetControlStrategyData ;
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
public class BudgetControlStrategyDaoTest {

    @Autowired
    private BudgetControlStrategyDao budgetControlStrategyDao;

    @Test
    public void testInsertLoadDelete() throws Exception {
        BudgetControlStrategyData data = new BudgetControlStrategyData();
        data.setId("");
        data.setPeriodType("");
        data.setDuration("");
        data.setLimitType("");
        data.setAlgorithmType("");
        data.setAlgorithmPercent("");
        data.setControlProperty("");
        data.setRecordStatus("");
        data.setUpdateTime("");
        data.setAddTime("");
        data.setAddLoginId("");
        data.setUpdateLoginId("");
        
        int id = budgetControlStrategyDao.insertBudgetControlStrategy(data);
        Assert.assertTrue(id > 0);

        BudgetControlStrategyData value = budgetControlStrategyDao.loadBudgetControlStrategyById(id);
        Assert.assertNotNull(value);

        budgetControlStrategyDao.deleteBudgetControlStrategyById(id);
    }
}

```

## 在appcontext-dao-fs.xml中加入

```xml
    <bean id="budgetControlStrategyDao" parent="parentDao">
        <property name="proxyInterfaces" value="com.dianping.ba.finance.budget.biz.dao.BudgetControlStrategyDao" />
        <property name="target">
            <bean parent="fsMain.daoRealizeTarget">
                <constructor-arg value="BudgetControlStrategy" />
            </bean>
        </property>
    </bean>
```

## 创建Service接口

```java
import com.dianping.ba.finance.budget.api.datas.BudgetControlStrategyData;

import java.util.List;

/**
 * Created by yangyongli
 */
public interface BudgetControlStrategyService {

    int insertBudgetControlStrategy(BudgetControlStrategyData data);

    BudgetControlStrategyData loadBudgetControlStrategyById(int id);

    int deleteBudgetControlStrategyById(int id);

}
```

## 创建ServiceObject

```
import com.dianping.ba.finance.budget.api.BudgetControlStrategyService;
import com.dianping.ba.finance.budget.api.datas.BudgetControlStrategyData;
import com.dianping.ba.finance.budget.biz.dao.BudgetControlStrategyDao;
import com.dianping.finance.common.aop.annotation.Log;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yangyongli
 */
public class BudgetControlStrategyServiceObject implements BudgetControlStrategyService {
    @Autowired
    BudgetControlStrategyDao BudgetControlStrategyDao;

    @Override
    @Log(logBefore = true, logAfter = true)
    public int insertBudgetControlStrategy(BudgetControlStrategyData data) {
        return BudgetControlStrategyDao.insertBudgetControlStrategy(data);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public BudgetControlStrategyData loadBudgetControlStrategyById(int id) {
        return BudgetControlStrategyDao.loadBudgetControlStrategyById(id);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public int deleteBudgetControlStrategyById(int id) {
        return BudgetControlStrategyDao.deleteBudgetControlStrategyById(id);
    }
}
```

## 配置Service

在biz的appcontext-service.xml中加入

```xml
    <bean id="budgetControlStrategyService" class="com.dianping.ba.finance.budget.biz.impl.BudgetControlStrategyServiceObject">
    </bean>
```

在service的appcontext-service.xml中加入

```xml
<entry key="http://service.dianping.com/budgetService/BudgetControlStrategyService_1.0.0" value-ref="budgetControlStrategyService"/>
```

在调用该Service的项目appcontext-client.xml中加入

```xml
    <bean id="budgetControlStrategyService" class="com.dianping.dpsf.spring.ProxyBeanFactory" init-method="init">
        <property name="serviceName" value="http://service.dianping.com/budgetService/BudgetControlStrategyService_1.0.0" />
        <property name="iface" value="com.dianping.ba.finance.budget.api.BudgetControlStrategyService" />
        <property name="serialize" value="hessian" />
        <property name="callMethod" value="sync" />
        <property name="timeoutRetry" value="true"/>
    </bean>
```
