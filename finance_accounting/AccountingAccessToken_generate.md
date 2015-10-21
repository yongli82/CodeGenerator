##在sqlmap/sqlmap-config.xml文件中加一行

```
<sqlMap resource="config/sqlmap/AccountingAccessToken/AccountingAccessToken.xml" />
```

##创建sqlmap文件  config/sqlmap/AccountingAccessToken/AccountingAccessToken.xml

```sql
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//ibatis.apache.org//DTD SQL Map 2.0//EN" "http://ibatis.apache.org/dtd/sql-map-2.dtd">
<sqlMap namespace="AccountingAccessToken">

    <typeAlias alias="AccountingAccessTokenData" type="com.dianping.ba.finance.budget.api.datas.AccountingAccessTokenData"/>
    <resultMap id="accountingAccessTokenData" class="AccountingAccessTokenData">
            <result property="id" column="Id"/>
            <result property="businessSource" column="BusinessSource"/>
            <result property="accessToken" column="AccessToken"/>
            <result property="addTime" column="AddTime"/>
            <result property="updateTime" column="UpdateTime"/>
            <result property="recordStatus" column="RecordStatus"/>
            
        </resultMap>

    <insert id="insertAccountingAccessToken" parameterClass="map">
        <![CDATA[
            INSERT INTO FC_AccountingAccessToken (
            Id,
            BusinessSource,
            AccessToken,
            AddTime,
            UpdateTime,
            RecordStatus
            ) VALUES (
            #data.id#,
            #data.businessSource#,
            #data.accessToken#,
            #data.addTime#,
            #data.updateTime#,
            #data.recordStatus#
            )
        ]]>
    <selectKey resultClass="java.lang.Integer" keyProperty="id">
        <![CDATA[
            SELECT @@IDENTITY AS id
        ]]>
    </selectKey>
    </insert>

    <select id="loadAccountingAccessTokenById" resultMap="accountingAccessTokenData" parameterClass="map">
        SELECT
        Id,
        BusinessSource,
        AccessToken,
        AddTime,
        UpdateTime,
        RecordStatus
        FROM FC_AccountingAccessToken
        WHERE Id = #id#
    </select>

    <delete id="deleteAccountingAccessTokenById" parameterClass="map">
        DELETE
        FROM FC_AccountingAccessToken
        WHERE Id = #id#
    </delete>

</sqlMap>
```

##创建Data对象： com.dianping.ba.finance.budget.api.datas.AccountingAccessTokenData
用IDE自动生成Setter和Getter

```java

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by yangyongli
 */
public class AccountingAccessTokenData implements Serializable {
    private int id;
    private int businessSource;
    private String accessToken;
    private Date addTime;
    private Date updateTime;
    private int recordStatus;
    

}
```

##创建DAO接口: 

```java

import com.dianping.avatar.dao.GenericDao;
import com.dianping.avatar.dao.annotation.DAOAction;
import com.dianping.avatar.dao.annotation.DAOActionType;
import com.dianping.avatar.dao.annotation.DAOParam;
import com.dianping.ba.finance.budget.api.datas.AccountingAccessTokenData;

public interface AccountingAccessTokenDao extends GenericDao {

    @DAOAction(action = DAOActionType.INSERT)
    int insertAccountingAccessToken(@DAOParam("data") AccountingAccessTokenData data);

    @DAOAction(action = DAOActionType.LOAD)
    AccountingAccessTokenData loadAccountingAccessTokenById(@DAOParam("id") int id);

    @DAOAction(action = DAOActionType.DELETE)
    int deleteAccountingAccessTokenById(@DAOParam("id") int id);
}
```

##创建DAOTest:

```java
import com.dianping.ba.finance.budget.api.datas.AccountingAccessTokenData ;
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
public class AccountingAccessTokenDaoTest {

    @Autowired
    private AccountingAccessTokenDao accountingAccessTokenDao;

    @Test
    public void testInsertLoadDelete() throws Exception {
        AccountingAccessTokenData data = new AccountingAccessTokenData();
        data.setId("");
        data.setBusinessSource("");
        data.setAccessToken("");
        data.setAddTime("");
        data.setUpdateTime("");
        data.setRecordStatus("");
        
        int id = accountingAccessTokenDao.insertAccountingAccessToken(data);
        Assert.assertTrue(id > 0);

        AccountingAccessTokenData value = accountingAccessTokenDao.loadAccountingAccessTokenById(id);
        Assert.assertNotNull(value);

        accountingAccessTokenDao.deleteAccountingAccessTokenById(id);
    }
}

```

## 在appcontext-dao-fs.xml中加入

```xml
    <bean id="accountingAccessTokenDao" parent="parentDao">
        <property name="proxyInterfaces" value="com.dianping.ba.finance.budget.biz.dao.AccountingAccessTokenDao" />
        <property name="target">
            <bean parent="fsMain.daoRealizeTarget">
                <constructor-arg value="AccountingAccessToken" />
            </bean>
        </property>
    </bean>
```

## 创建Service接口

```java
import com.dianping.ba.finance.budget.api.datas.AccountingAccessTokenData;

import java.util.List;

/**
 * Created by yangyongli
 */
public interface AccountingAccessTokenService {

    int insertAccountingAccessToken(AccountingAccessTokenData data);

    AccountingAccessTokenData loadAccountingAccessTokenById(int id);

    int deleteAccountingAccessTokenById(int id);

}
```

## 创建ServiceObject

```
import com.dianping.ba.finance.budget.api.AccountingAccessTokenService;
import com.dianping.ba.finance.budget.api.datas.AccountingAccessTokenData;
import com.dianping.ba.finance.budget.biz.dao.AccountingAccessTokenDao;
import com.dianping.finance.common.aop.annotation.Log;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by yangyongli
 */
public class AccountingAccessTokenServiceObject implements AccountingAccessTokenService {
    @Autowired
    AccountingAccessTokenDao AccountingAccessTokenDao;

    @Override
    @Log(logBefore = true, logAfter = true)
    public int insertAccountingAccessToken(AccountingAccessTokenData data) {
        return AccountingAccessTokenDao.insertAccountingAccessToken(data);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public AccountingAccessTokenData loadAccountingAccessTokenById(int id) {
        return AccountingAccessTokenDao.loadAccountingAccessTokenById(id);
    }

    @Override
    @Log(logBefore = true, logAfter = true)
    public int deleteAccountingAccessTokenById(int id) {
        return AccountingAccessTokenDao.deleteAccountingAccessTokenById(id);
    }
}
```

## 配置Service

在biz的appcontext-service.xml中加入

```xml
    <bean id="accountingAccessTokenService" class="com.dianping.ba.finance.budget.biz.impl.AccountingAccessTokenServiceObject">
    </bean>
```

在service的appcontext-service.xml中加入

```xml
<entry key="http://service.dianping.com/budgetService/AccountingAccessTokenService_1.0.0" value-ref="accountingAccessTokenService"/>
```

在调用该Service的项目appcontext-client.xml中加入

```xml
    <bean id="accountingAccessTokenService" class="com.dianping.dpsf.spring.ProxyBeanFactory" init-method="init">
        <property name="serviceName" value="http://service.dianping.com/budgetService/AccountingAccessTokenService_1.0.0" />
        <property name="iface" value="com.dianping.ba.finance.budget.api.AccountingAccessTokenService" />
        <property name="serialize" value="hessian" />
        <property name="callMethod" value="sync" />
        <property name="timeoutRetry" value="true"/>
    </bean>
```
